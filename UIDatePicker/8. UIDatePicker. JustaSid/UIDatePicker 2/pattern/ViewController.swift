import UIKit

class ViewController: UIViewController {
    
    private let userProfileView = UserProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userProfileView)
        setupUserProfileViewConstraints()
        view.backgroundColor = .white
    }

    private func setupUserProfileViewConstraints() {
        userProfileView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = userProfileView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor) // ограничение левого края
        let trailing = userProfileView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)  // ограничение правого края
        let top = userProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)  // ограничение по верхнему краю
        let bottom = userProfileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor) // ограничение по нижнему краю
        
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }
    
}
