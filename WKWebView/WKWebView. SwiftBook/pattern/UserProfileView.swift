import UIKit
import WebKit

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var textViewDelegate: TextViewDelegateProtocol
    private let webView: WKWebView
    private let backButton: UIButton
    private let forwardButton: UIButton
    private let urlTextField: UITextField
    private let stackView: UIStackView
    
    init() {
        self.textViewDelegate = TextViewDelegate()
        self.webView = WKWebView()
        self.backButton = UIButton()
        self.forwardButton = UIButton()
        self.urlTextField = UITextField()
        self.stackView = UIStackView()
        
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var textViewDelegate: TextViewDelegateProtocol { get set }
}

private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = .white
        setupStackView()
        
        addSubview(stackView)
        addSubview(webView)
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(urlTextField)
        stackView.addArrangedSubview(forwardButton)
        
        setupStackViewConstraints()
        setupWebViewConstraints()
        
        setupStackView()
        setupWebView()
        setupBackButton()
        setupForwardButton()
        setupUrlTextField()
    }
    
    func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        let leading = stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
        let trailing = stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        let height = stackView.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupWebViewConstraints() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = webView.topAnchor.constraint(equalTo: stackView.bottomAnchor)
        let leading = webView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
        let trailing = webView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        let bottom = webView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([top, leading, trailing, bottom])
    }
    
    func setupStackView() {
        stackView.axis = .horizontal // ось расположения элементов
        stackView.distribution = .fillProportionally // растяжение элементов по всему размеру stackView в зависимости от содержимого
        stackView.spacing = 5 // расстояние между элементами
    }
    
    func setupWebView() {
        guard let url = URL(string: "https://www.youtube.com") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true // разрешение жестов навигации вперед и назад внутри веб-представлени
    }
    
    func setupBackButton() {
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
    }
    
    func setupForwardButton() {
        forwardButton.setTitle("Forward", for: .normal)
        forwardButton.setTitleColor(.black, for: .normal)
    }
    
    func setupUrlTextField() {
        urlTextField.placeholder = "_"
    }
    
}
