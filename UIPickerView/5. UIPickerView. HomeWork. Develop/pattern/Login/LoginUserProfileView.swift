import UIKit

// MARK: - LoginUserProfileViewProtocol
protocol LoginUserProfileViewProtocol: UIView {
    var delegate: LoginViewControllerProtocol? { get set }
}

class LoginUserProfileView: UIView, LoginUserProfileViewProtocol {
    
    weak var delegate: LoginViewControllerProtocol?
    
    private let topLabel: UILabel
    private let label: UILabel
    private let loginLabel: UILabel
    private let loginTextField: UITextField
    private let passwordLabel: UILabel
    private let passwordTextField: UITextField
    private let logInButton: UIButton
    private let button: UIButton
    private let faceLabel: UILabel
    private let faceSwitch: UISwitch
    private let faceStackView: UIStackView
    
    init() {
        self.topLabel = UILabel()
        self.label = UILabel()
        self.loginLabel = UILabel()
        self.loginTextField = UITextField()
        self.passwordLabel = UILabel()
        self.passwordTextField = UITextField()
        self.logInButton = UIButton()
        self.button = UIButton()
        self.faceLabel = UILabel()
        self.faceSwitch = UISwitch()
        self.faceStackView = UIStackView()
        
        super.init(frame: .zero)
        setupUserView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension LoginUserProfileView {
    
    func setupUserView() {
        backgroundColor = .white
        
        setupTopLabel()
        setupLabel()
        setupLoginLabel()
        setupLoginTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupPasswordLogInButton()
        setupButton()
        setupFaceStackView()
        
        addSubview(topLabel)
        addSubview(label)
        addSubview(loginLabel)
        addSubview(loginTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(logInButton)
        addSubview(button)
        addSubview(faceStackView)
        
        setupTopLabelConstraints()
        setupLabelConstraints()
        setupLoginLabelConstraints()
        setupLoginTextFieldConstraints()
        setupPasswordLabelConstraints()
        setupPasswordTextFieldConstraints()
        setupPasswordLogInButtonConstraints()
        setupButtonConstraints()
        setupFaceStackViewConstraints()
    }
    
    func setupTopLabel() {
        topLabel.text = "Birthday Reminder"
        topLabel.font = UIFont.boldSystemFont(ofSize: 22)
        topLabel.textColor = .systemBlue
        topLabel.layer.borderWidth = 2
        topLabel.textAlignment = .center
        topLabel.layer.cornerRadius = 5
    }
    
    func setupLabel() {
        label.text = "Sign in"
        label.font = UIFont.boldSystemFont(ofSize: 22)
    }
    
    func setupLoginLabel() {
        loginLabel.text = "Email"
        loginLabel.font = UIFont.boldSystemFont(ofSize: 12)
        loginLabel.textColor = .systemBlue
    }
    
    func setupLoginTextField() {
        loginTextField.placeholder = "Введите Email"
        setupLineTextField(loginTextField)
    }
    
    func setupPasswordLabel() {
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 12)
        passwordLabel.textColor = .systemBlue
    }
    
    func setupPasswordTextField() {
        passwordTextField.placeholder = "Введите password"
        setupLineTextField(passwordTextField)
    }
    
    func setupPasswordLogInButton() {
        logInButton.setTitle("Войти", for: .normal)
        logInButton.backgroundColor = .systemBlue
        logInButton.layer.cornerRadius = 5
        logInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        logInButton.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
    }
    
    func setupFaceLabel() {
        faceLabel.text = "Вход по FaceID?"
        faceLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func setupFaceSwitch() {
        faceSwitch.onTintColor = .systemBlue
    }
    
    func setupFaceStackView() {
        setupFaceLabel()
        setupFaceSwitch()
        faceStackView.spacing = 8
        faceStackView.addArrangedSubview(faceLabel)
        faceStackView.addArrangedSubview(faceSwitch)
    }
    
    @objc func logInButtonAction() {
        UIView.animate(withDuration: 0.1, animations: { // задержка 0.1 секунда
            self.logInButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) // размер кнопки 90%
        }) { _ in
            UIView.animate(withDuration: 0.1,
                           animations: { self.logInButton.transform = CGAffineTransform.identity }) // возврат размера в исходное состояние
            self.delegate?.navigate(.bithdayViewController) // переход на другой экран после
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
    
    func setupTopLabelConstraints() {
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = topLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20)
        let leading = topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80)
        let trailing = topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        let height = topLabel.heightAnchor.constraint(equalToConstant: 70)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let top = label.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 30)
        let leading = label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = label.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupLoginLabelConstraints() {
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = loginLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        let leading = loginLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = loginLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = loginLabel.heightAnchor.constraint(equalToConstant: 20)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupLoginTextFieldConstraints() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5)
        let leading = loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = loginTextField.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupPasswordLabelConstraints() {
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20)
        let leading = passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = passwordLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = passwordLabel.heightAnchor.constraint(equalToConstant: 20)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupPasswordTextFieldConstraints() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5)
        let leading = passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = passwordTextField.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupFaceStackViewConstraints() {
        faceStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = faceStackView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30)
        let leading = faceStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = faceStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = faceStackView.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupPasswordLogInButtonConstraints() {
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = logInButton.topAnchor.constraint(equalTo: faceStackView.bottomAnchor, constant: 30)
        let leading = logInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = logInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = logInButton.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let top = button.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5)
        let width = button.widthAnchor.constraint(equalToConstant: 30)
        let trailing = button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = button.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, width, trailing, height])
    }
    
    func setupLineTextField(_ textField: UITextField) {
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.masksToBounds = false
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowOffset = CGSize(width: textField.frame.width, height: 1)
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowRadius = 0.0
    }
    
}
