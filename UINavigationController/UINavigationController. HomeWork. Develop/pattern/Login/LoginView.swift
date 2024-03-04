import UIKit

// MARK: - UserProfileViewProtocol
protocol LoginViewProtocol: UIView {
    var loginViewControllerDelegate: LoginViewController? { get set }
}

class LoginView: UIView, LoginViewProtocol {
    
    weak var loginViewControllerDelegate: LoginViewController?
    private let pizzaImage: UIImageView
    private let emailStack: UIStackView
    private let passwordStack: UIStackView
    private let tapGesture: UITapGestureRecognizer
    private let enterButton: UIButton
    
    init() {
        self.pizzaImage = UIImageView()
        self.emailStack = UIStackView()
        self.passwordStack = UIStackView()
        self.tapGesture = UITapGestureRecognizer()
        self.enterButton = UIButton()
        super.init(frame: .zero)
        setupLoginView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension LoginView {
    
    func setupLoginView() {
        backgroundColor = .white
        tapGesture.addTarget(self, action: #selector(handleTap)) // handleTap вызывается при тапе на свободной области экрана
        pizzaImage.image = UIImage(named: "pizza")
        
        setupEmailStack()
        setupPasswordStack()
        setupEnterButton()
        
        addSubview(pizzaImage)
        addSubview(emailStack)
        addSubview(passwordStack)
        addSubview(enterButton)
        addGestureRecognizer(tapGesture) // добавление жеста тапа к текущему экрану
        
        setupPizzaImageConstraints()
        setupEmailStackConstraints()
        setupPasswordStackConstraint()
        setupEnterButtonConstraint()
    }
    
    @objc func handleTap() {
        endEditing(true) // закрытие клавиатуры для всех текстовых полей
    }
    
    func setupEmailStack() {
        let emailLabel = UILabel().setupLabel()
        emailLabel.text = "Email"
        
        let emailTextField = UITextField().setupLineTextField()
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "Введите почту"
        
        emailStack.axis = .vertical
        emailStack.spacing = 8
        emailStack.addArrangedSubview(emailLabel)
        emailStack.addArrangedSubview(emailTextField)
    }
    
    func setupPasswordStack() {
        let passwordLabel = UILabel().setupLabel()
        passwordLabel.text = "Password"
        
        let passwordTextField = UITextField().setupLineTextField()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardType = .numberPad
        passwordTextField.placeholder = "Введите пароль"
        
        passwordStack.axis = .vertical
        passwordStack.spacing = 8
        passwordStack.addArrangedSubview(passwordLabel)
        passwordStack.addArrangedSubview(passwordTextField)
    }
    
    func setupEnterButton() {
        enterButton.setTitleColor(.systemBlue, for: .normal)
        enterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        enterButton.layer.borderColor = UIColor.black.cgColor
        enterButton.layer.borderWidth = 2
        enterButton.layer.cornerRadius = 5
        enterButton.setTitle("Войти", for: .normal)
        enterButton.addTarget(self, action: #selector(tapEnterButton), for: .touchUpInside)
    }
    
    @objc func tapEnterButton() {
        enterButton.setupTapButton()
        let controller = FoodViewController()
        loginViewControllerDelegate?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func setupPizzaImageConstraints() {
        pizzaImage.translatesAutoresizingMaskIntoConstraints = false
        
        let top = pizzaImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let centerX = pizzaImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = pizzaImage.widthAnchor.constraint(equalToConstant: 200)
        let height = pizzaImage.heightAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([top, centerX, width, height])
    }
    
    func setupEmailStackConstraints() {
        emailStack.translatesAutoresizingMaskIntoConstraints = false
        
        let top = emailStack.topAnchor.constraint(equalTo: pizzaImage.bottomAnchor, constant: 30)
        let height = emailStack.heightAnchor.constraint(equalToConstant: 50)
        let leading = emailStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35)
        let trailing = emailStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -35)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupPasswordStackConstraint() {
        passwordStack.translatesAutoresizingMaskIntoConstraints = false
        
        let top = passwordStack.topAnchor.constraint(equalTo: emailStack.bottomAnchor, constant: 16)
        let height = passwordStack.heightAnchor.constraint(equalToConstant: 50)
        let leading = passwordStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35)
        let trailing = passwordStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -35)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupEnterButtonConstraint() {
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = enterButton.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 30)
        let centerX = enterButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let height = enterButton.heightAnchor.constraint(equalToConstant: 40)
        let width = enterButton.widthAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, centerX, width, height])
    }
}
