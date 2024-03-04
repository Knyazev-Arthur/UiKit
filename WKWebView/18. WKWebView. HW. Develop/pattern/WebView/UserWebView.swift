import UIKit
import WebKit

// MARK: UserWebViewProtocol
protocol UserWebViewProtocol: WKWebView {
    var delegateWebViewController: WebViewController? { get set }
    var device: String { get set }
}

class UserWebView: WKWebView, UserWebViewProtocol {
    
    weak var delegateWebViewController: WebViewController?
    var device: String = "" {
        didSet {
            setupUserWebView()
        }
    }
    private var urlRequest: URLRequest
    private let toolBar: UIToolbar
    private let backButton: UIBarButtonItem
    private let forwardButton: UIBarButtonItem
    private let space: UIBarButtonItem
    private let refreshButton: UIBarButtonItem
    
    init() {
        self.toolBar = UIToolbar()
        self.backButton = UIBarButtonItem(barButtonSystemItem: .rewind, target: nil, action: nil)
        self.forwardButton = UIBarButtonItem(barButtonSystemItem: .fastForward, target: nil, action: nil)
        self.space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: nil, action: nil)
        self.urlRequest = URLRequest(url: URL(string: "https://www.ya.ru")!)
        super.init(frame: .zero, configuration: .init())
        setupUserWebView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UserWebView {
    
    func setupUserWebView() {
        delegateWebViewController?.userWebView = self
        setupToolBar()
        addSubview(toolBar)
        settingURL()
        load(urlRequest)
        setupToolBarConstraints()
    }
    
    func settingURL() {
        switch device {
        case "iPhone":
            guard let url = URL(string: "https://www.apple.com/iphone/") else { return }
            urlRequest = URLRequest(url: url)
        case "iPad":
            guard let url = URL(string: "https://www.apple.com/ipad/") else { return }
            urlRequest = URLRequest(url: url)
        case "macBook":
            guard let url = URL(string: "https://www.apple.com/mac/") else { return }
            urlRequest = URLRequest(url: url)
        default:
            break
        }
    }
    
    func setupToolBar() {
        backButton.action = #selector(backAction)
        forwardButton.action = #selector(forwardAction)
        refreshButton.action = #selector(refreshAction)
        toolBar.items = [backButton, forwardButton, space, refreshButton]
    }
    
    @objc func backAction() {
        guard canGoBack else { return }
        goBack()
    }
    
    @objc func forwardAction() {
        guard canGoForward else { return }
        goForward()
    }
    
    @objc func refreshAction() {
        reload()
    }
    
    func setupToolBarConstraints() {
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        let height = toolBar.heightAnchor.constraint(equalToConstant: 40)
        let leading = toolBar.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailing = toolBar.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottom = toolBar.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        NSLayoutConstraint.activate([height, leading, trailing, bottom])
    }
    
}
