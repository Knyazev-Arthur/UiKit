import UIKit

class ViewController: UIViewController {
    
    private let customView = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customView)
        
        customView.actionOne = { [weak self] alert in
            self?.present(alert, animated: true)
        }

        setupCustomView()
    }
    
    private func setupCustomView() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = customView.topAnchor.constraint(equalTo: view.topAnchor)
        let bottom = customView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let leading = customView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailing = customView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        let constraints = [top,bottom,leading,trailing]
        NSLayoutConstraint.activate(constraints) // активация ограничений кастомного экрана
    }
}

