import UIKit

class WebViewController: UIViewController {
    
    private let userWebView: UserProfileViewProtocol
    
    init() {
        userWebView = UserWebView()
        super.init(nibName: nil, bundle: nil)
        view.addSubview(userWebView)
        view.backgroundColor = .white
        setupUserWebViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserWebViewConstraints() {
        userWebView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = userWebView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trailing = userWebView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let top = userWebView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let bottom = userWebView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }

}
