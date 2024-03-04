import UIKit
import WebKit

// MARK: - UserProfileViewProtocol
protocol UserWebViewProtocol: WKWebView {
    var delegate: DelegateNavigationWebProtocol { get set }
    func goButtonIsEnabledFalse()
    func goBackButtonIsEnabled()
    func goForwardButtonIsEnabled()
    func isWorkIndicatorTrue()
    func isWorkIndicatorFalse()
}

class UserWebView: WKWebView, UserWebViewProtocol {
    
    var delegate: DelegateNavigationWebProtocol
    private let toolBar: UIToolbar
    private let backButtonItem: UIBarButtonItem
    private let forwardButtonItem: UIBarButtonItem
    private let spacer: UIBarButtonItem
    private let refreshButtonItem: UIBarButtonItem
    private let activityIndicator: UIActivityIndicatorView
    private let aplication: UIApplication
    
    init() {
        self.delegate = DelegateNavigationWeb()
        self.toolBar = UIToolbar()
        self.backButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: nil, action: nil)
        self.forwardButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: nil, action: nil)
        self.spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.refreshButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: nil, action: nil)
        self.activityIndicator = UIActivityIndicatorView()
        self.aplication = UIApplication.shared
        
        super.init(frame: .zero, configuration: .init())
        setupUserWebView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func goButtonIsEnabledFalse() {
        backButtonItem.isEnabled = false
        forwardButtonItem.isEnabled = false
    }
    
    func goBackButtonIsEnabled() {
        backButtonItem.isEnabled = true
    }
    
    func goForwardButtonIsEnabled() {
        forwardButtonItem.isEnabled = true
    }
    
    func isWorkIndicatorTrue() {
        isWorkIndicator(isAnimated: true, indicator: activityIndicator)
    }
    
    func isWorkIndicatorFalse() {
        isWorkIndicator(isAnimated: false, indicator: activityIndicator)
    }

}

private extension UserWebView {
    
    func setupUserWebView() {
        delegate.userWebView = self
        navigationDelegate = delegate
        
        backButtonItem.action = #selector(backAction)
        forwardButtonItem.action = #selector(forwardAction)
        refreshButtonItem.action = #selector(refreshAction)
        
        loadRequest()
        toolBar.items = [backButtonItem, forwardButtonItem, spacer, refreshButtonItem]
        activityIndicator.style = .medium
        
        addSubview(toolBar)
        addSubview(activityIndicator)
        
        setupToolBarConstraints()
        setupActivityIndicatorConstraints()
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
        reload() // метод обновляющий страницу
    }

    func loadRequest() { // метод загрузки запроса URL
        guard let url = URL(string: "https://www.google.ru/") else { return } // создаем URL адрес
        let urlRequest = URLRequest(url: url) // создаем объект URLRequest, представляющий собой запрос к соответствующему адресу
        load(urlRequest) // передача метода в метод загрузки запроса
//        print(url.port, url.user, url.scheme)
    }
    
    func loadPdf() {
        guard let urlPdf = Bundle.main.url(forResource: "ios", withExtension: "pdf") else { return } // создаем URL адрес
        let urlRequest = URLRequest(url: urlPdf) // создаем объект URLRequest, представляющий собой запрос к соответствующему адресу
        load(urlRequest)
    }
    
    func setupToolBarConstraints() {
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        let height = toolBar.heightAnchor.constraint(equalToConstant: 40)
        let leading = toolBar.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailing = toolBar.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let bottom = toolBar.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        NSLayoutConstraint.activate([height, leading, trailing, bottom])
    }
    
    func setupActivityIndicatorConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        let centerY = activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        NSLayoutConstraint.activate([centerX, centerY])
    }
    
    func isWorkIndicator(isAnimated: Bool, indicator: UIActivityIndicatorView) {
        aplication.isNetworkActivityIndicatorVisible = isAnimated
        if isAnimated {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
        } else {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
        }
    }
    
}
