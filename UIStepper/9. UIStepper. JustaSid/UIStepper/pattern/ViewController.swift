import UIKit

class ViewController: UIViewController {
    
    private let userProfileView: UserProfileView = UserProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userProfileView)
        setupUserProfileViewConstraints()
    }

    private func setupUserProfileViewConstraints() {
        userProfileView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = userProfileView.topAnchor.constraint(equalTo: view.topAnchor)
        let leading = userProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailing = userProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bottom = userProfileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }
}
