import UIKit
import WebKit

class UserWebView: WKWebView, UserWebViewProtocol {
    
    var customNavigationDelegate: NavigationDelegateProtocol
    
    private let toolBar: UIToolbar
    private let backButtonItem: UIBarButtonItem
    private let forwardButtonItem: UIBarButtonItem
    private let spacer: UIBarButtonItem
    private let refreshButtonItem: UIBarButtonItem
    
    init() {
        self.customNavigationDelegate = NavigationDelegate()
        self.toolBar = UIToolbar()
        self.backButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: nil, action: nil) // кнопка назад
        self.forwardButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: nil, action: nil) // кнопка вперед
        self.spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) // разделить между кнопками
        self.refreshButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: nil, action: nil) // кнопка обновить
        super.init(frame: .zero, configuration: .init()) // .init() используется для передачи пустой конфигурации WKWebViewConfiguration, поскольку настройка осуществляется самостоятельно в текущем файле
        setupWebView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonIsEnabled() {
        backButtonItem.isEnabled = canGoBack
        forwardButtonItem.isEnabled = canGoForward
    }
    
}

// MARK: - UserWebViewProtocol
protocol UserWebViewProtocol: WKWebView {
    var customNavigationDelegate: NavigationDelegateProtocol { get set }
}

private extension UserWebView {
    
    func setupWebView() {
        loadRequest()
//        loadPDF()
//        loadHtml()
        navigationDelegate = customNavigationDelegate
        
        setupCustomNavigationDelegate()
        setupToolBar()
        addSubview(toolBar)
        setupToolBarConstraints()
        
        backButtonItem.action = #selector(backAction)
        forwardButtonItem.action = #selector(forwardAction)
        refreshButtonItem.action = #selector(refreshAction)
    }
    
    func setupToolBar() {
        toolBar.items = [backButtonItem, forwardButtonItem, spacer, refreshButtonItem] // добавление кнопок на toolBar
    }
    
    func setupToolBarConstraints() {
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        let height = toolBar.heightAnchor.constraint(equalToConstant: 40)
        let leading = toolBar.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailing = toolBar.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let bottom = toolBar.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        NSLayoutConstraint.activate([height, leading, trailing, bottom])
    }
    
    func setupCustomNavigationDelegate() {
        customNavigationDelegate.userWebView = self
    }
    
    @objc func backAction() {
        guard canGoBack else { return } // если загрузка предыдущей страницы невозможна - выход
        goBack() // загрузка предыдущей страницы
    }
    
    @objc func forwardAction() {
        guard canGoForward else { return }
        goForward()
    }
    
    @objc func refreshAction() {
        reload() // метод обновляющий страницу
    }
    
    // метод загрузки запроса URL
    func loadRequest() {
        guard let url = URL(string: "https://www.google.ru/") else { return } // создаем URL адрес
        let urlRequest = URLRequest(url: url) // создаем объект URLRequest, представляющий собой запрос к соотвутствующему адресу
        load(urlRequest) // передача метода в метод загрузки запроса
    }
    
    // метод загрузки файла
    func loadPDF() {
        guard let url = Bundle.main.url(forResource: "iOS", withExtension: "pdf") else { return } // main означает обращение к настоящему приложению, url(forResource:withExtension:) - метод Bundle, который используется для поиска URL-адреса файла по его имени и расширению
        let urlRequest = URLRequest(url: url) // создаем объект URLRequest, представляющий собой запрос к соотвутствующему адресу
        load(urlRequest) // передача метода в метод загрузки запроса
    }
    
    // метод для загрузки файла HTML в представлении web страницы
    func loadHtml() {
        loadHTMLString(Source.htmlString, baseURL: nil) // baseURL используется для определения базового URL-адреса для относительных ссылок и ресурсов в HTML. nil означает, что относительные ссылки будут рассматриваться относительно корня самой загруженной HTML-страницы.
    }
}
