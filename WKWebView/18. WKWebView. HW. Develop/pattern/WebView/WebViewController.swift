import UIKit

// MARK: PageControllerProtocol
protocol WebViewControllerProtocol {
    var userWebView: UserWebViewProtocol { get set }
}

class WebViewController: UIViewController, WebViewControllerProtocol  {
    
    var userWebView: UserWebViewProtocol
    
    init() {
        userWebView = UserWebView()
        super.init(nibName: nil, bundle: nil)
        userWebView.delegateWebViewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = userWebView
    }

}
