import UIKit

class ViewController: UIViewController {
    
    private let customView = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customView) // добавление кастомного экрана на главный экран
        setupContraints() // размещение кастомного экрана на главном экране
    }
    
    private func setupContraints() {
        customView.translatesAutoresizingMaskIntoConstraints = false // откл автоматическую настройку ограничений
        
        // установка ограничений
        let top = customView.topAnchor.constraint(equalTo: view.topAnchor)
        let bottom = customView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let leading = customView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailing = customView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        let constraints = [top,bottom,leading,trailing]
        NSLayoutConstraint.activate(constraints) // активация ограничений кастомного экрана
    }
}

