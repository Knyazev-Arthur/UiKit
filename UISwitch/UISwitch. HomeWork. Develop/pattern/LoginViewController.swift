import UIKit

class LoginViewController: UIViewController {
    
    private let imageView: UIImageView
    private let label: UILabel
    private let loginLabel: UILabel
    private let loginTextField: UITextField
    private let loginBottomLine: CALayer
    private let passwordLabel: UILabel
    private let passwordTextField: UITextField
    private let passwordBottomLine: CALayer
    private let logInButton: UIButton
    private let button: UIButton
    
    init() {
        self.imageView = UIImageView()
        self.label = UILabel()
        self.loginLabel = UILabel()
        self.loginTextField = UITextField()
        self.loginBottomLine = CALayer()
        self.passwordLabel = UILabel()
        self.passwordTextField = UITextField()
        self.passwordBottomLine = CALayer()
        self.logInButton = UIButton()
        self.button = UIButton()
        super.init(nibName: nil, bundle: nil)
        setupUserView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setting(a: loginBottomLine, textField: loginTextField)
        setting(a: passwordBottomLine, textField: passwordTextField)
    }
}

private extension LoginViewController {
    
    func setupUserView() {
        view.backgroundColor = .white
        
        setupImageView()
        setupLabel()
        setupLoginLabel()
        setupLoginTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupPasswordLogInButton()
        setupButton()
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
        view.addSubview(button)
        
        setupImageViewConstraints()
        setupLabelConstraints()
        setupLoginLabelConstraints()
        setupLoginTextFieldConstraints()
        setupPasswordLabelConstraints()
        setupPasswordTextFieldConstraints()
        setupPasswordLogInButtonConstraints()
        setupButtonConstraints()
    }
    
    func setupImageView() {
        imageView.image = UIImage(systemName: "icloud.fill")
        imageView.contentMode = .scaleAspectFit
    }
    
    func setupLabel() {
        label.text = "Sign in"
        label.font = UIFont.boldSystemFont(ofSize: 22)
    }
    
    func setupLoginLabel() {
        loginLabel.text = "Email"
        loginLabel.font = UIFont.boldSystemFont(ofSize: 12)
        loginLabel.textColor = .orange
    }
    
    func setupLoginTextField() {
        loginTextField.placeholder = "Введите Email"
        loginTextField.layer.addSublayer(loginBottomLine)
    }
    
    func setupPasswordLabel() {
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 12)
        passwordLabel.textColor = .orange
    }
    
    func setupPasswordTextField() {
        passwordTextField.placeholder = "Введите password"
        passwordTextField.layer.addSublayer(passwordBottomLine)
    }
    
    func setupPasswordLogInButton() {
        logInButton.setTitle("Войти", for: .normal)
        logInButton.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1.0)
        logInButton.layer.cornerRadius = 5
        logInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        logInButton.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
    }
    
    @objc func logInButtonAction() {
        
        UIView.animate(withDuration: 0.1, animations: {
            self.logInButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.logInButton.transform = CGAffineTransform.identity
            }) { _ in
                let controller = CafeViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
        
    }
    
    func setupButton() {
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
    }
    
    @objc func showPasswordButtonTapped() {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        button.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leading = imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        let trailing = imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        let height = imageView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let top = label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30)
        let leading = label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = label.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupLoginLabelConstraints() {
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = loginLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        let leading = loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = loginLabel.heightAnchor.constraint(equalToConstant: 20)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupLoginTextFieldConstraints() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5)
        let leading = loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = loginTextField.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupPasswordLabelConstraints() {
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20)
        let leading = passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = passwordLabel.heightAnchor.constraint(equalToConstant: 20)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupPasswordTextFieldConstraints() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5)
        let leading = passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = passwordTextField.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupPasswordLogInButtonConstraints() {
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30)
        let leading = logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = logInButton.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let top = button.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5)
        let width = button.widthAnchor.constraint(equalToConstant: 30)
        let trailing = button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = button.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, width, trailing, height])
    }
    
    func setting(a line: CALayer, textField: UITextField) {
        line.frame = CGRect(origin: CGPoint(x: 0, y: textField.frame.height - 1),
                                      size: CGSize(width: textField.frame.width, height: 1))
        line.backgroundColor = UIColor.gray.cgColor
        line.opacity = 0.5
    }
    
}
