import UIKit

class ViewController: UIViewController {
    
    private let customView = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // добавление кастомного экрана на экран view
        view.addSubview(customView)
        setupConstraints()
    }
    
    // метод размещения кастомного экрана на экране view
    private func setupConstraints() {
        // откл автоматический расчет ограничений
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        // установка ограничений кастомного экрана
        let leading = customView.leadingAnchor.constraint(equalTo: view.leadingAnchor) // ограничение левого края
        let trailing = customView.trailingAnchor.constraint(equalTo: view.trailingAnchor)  // ограничение правого края
        let top = customView.topAnchor.constraint(equalTo: view.topAnchor)  // ограничение по верхнему краю
        let bottom = customView.bottomAnchor.constraint(equalTo: view.bottomAnchor) // ограничение по нижнему краю
        
        // активация констрейнтов
        let constraints = [leading, trailing, top, bottom]
        NSLayoutConstraint.activate(constraints)
    }
    
}
