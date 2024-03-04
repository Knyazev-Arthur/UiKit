import UIKit

class ViewController: UIViewController {
    
    private let customView = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customView)
        setupCustomViewConstraints()
    }
    
    private func setupCustomViewConstraints() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = customView.topAnchor.constraint(equalTo: view.topAnchor)
        let bottom = customView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let leading = customView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailing = customView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        NSLayoutConstraint.activate([top,bottom,leading,trailing])
    }
}
