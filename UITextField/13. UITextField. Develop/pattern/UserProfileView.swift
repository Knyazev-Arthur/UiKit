import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var textFieldDelegate: TextFieldDelegateProtocol { get set }
    var textField: UITextField { get set }
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var textFieldDelegate: TextFieldDelegateProtocol
    var textField: UITextField
    
    init() {
        self.textField = UITextField()
        self.textFieldDelegate = TextFieldDelegate()
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension UserProfileView {
    
    func setupUserProfileView() {
        textFieldDelegate.userProfileView = self
        setupNotificationCenterField()
        backgroundColor = UIColor(ciColor: .cyan)
        setupTextField()
        addSubview(textField)
        setupTextFieldConstraints()
    }

    // использование NotificationCenter - это общий способ реагировать на различные события в приложении. Мы отселживанием любое изменение в поле
    func setupNotificationCenterField() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textFieldTextDidChange),
                                               name: UITextField.textDidChangeNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: nil) { _ in self.frame.origin.y = -200 }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: nil) { _ in self.frame.origin.y = 0.0 }
    }
    
    @objc func textFieldTextDidChange(param: NSNotification) {
        print("UITextField.textDidChangeNotification - \(param)")
    }
    
    func setupTextField() {
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.placeholder = "I'am Swift Developer"
        textField.delegate = textFieldDelegate
    }
    
    func setupTextFieldConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = textField.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerY = textField.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let height = textField.heightAnchor.constraint(equalToConstant: 35)
        let width = textField.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([centerX, centerY, height, width])
    }
    
}
