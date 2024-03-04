import UIKit

class ViewController: UIViewController {

    private let userWebView = UserWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userWebView)
        setupUserProfileViewConstraints()
    }

    private func setupUserProfileViewConstraints() {
        view.backgroundColor = .white
        userWebView.translatesAutoresizingMaskIntoConstraints = false

        let top = userWebView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leading = userWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailing = userWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bottom = userWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }
}
