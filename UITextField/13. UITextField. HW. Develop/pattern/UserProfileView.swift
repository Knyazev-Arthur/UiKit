import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var textFieldDelegate: TextFieldDelegateProtocol { get set }
    var textFieldOne: UITextField { get set }
    var textFieldTwo: UITextField { get set }
    var textFieldThree: UITextField { get set }
    var textFields: [UITextField] { get set }
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var textFieldDelegate: TextFieldDelegateProtocol
    var textFieldOne: UITextField
    var textFieldTwo: UITextField
    var textFieldThree: UITextField
    var textFields: [UITextField]
    
    init() {
        self.textFieldOne = UITextField()
        self.textFieldTwo = UITextField()
        self.textFieldThree = UITextField()
        self.textFields = [textFieldOne, textFieldTwo, textFieldThree]
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
        
        setupTextFieldOne()
        setupTextFieldTwo()
        setupTextFieldThree()
        addSubview(textFieldOne)
        addSubview(textFieldTwo)
        addSubview(textFieldThree)
        setupTextFieldOneConstraints()
        setupTextFieldTwoConstraints()
        setupTextFieldThreeConstraints()
    }

    // использование NotificationCenter - метод, добавляющий объект для наблюдения.
    func setupNotificationCenterField() {
        NotificationCenter.default.addObserver(self, // объект, за которым ведется наблюдение
                                               selector: #selector(textFieldTextDidChange),
                                               name: UITextField.textDidChangeNotification, // имя уведомления, на которое мы реагируем
                                               object: nil) // объект, который будет отправителем уведомления. В данном случае, уведомление может прийти от любого объекта, поэтому nil
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, // уведомление о появлении клавиатуры
                                               object: nil,
                                               queue: nil) { _ in self.frame.origin.y = -200 }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, // уведомления о скрытии клавиатуры
                                               object: nil,
                                               queue: nil) { _ in self.frame.origin.y = 0.0 }
    }
    
    @objc func textFieldTextDidChange(param: NSNotification) {
        print("UITextField.textDidChangeNotification - \(param)")
    }
    
    func setupTextFieldOne() {
        textFieldOne.borderStyle = .roundedRect
        textFieldOne.textAlignment = .center
        textFieldOne.placeholder = "I'am Swift Developer"
        textFieldOne.delegate = textFieldDelegate
        textFieldOne.addTarget(self, action: #selector(textFieldDidReturn), for: .editingDidEndOnExit)
    }
    
    func setupTextFieldTwo () {
        textFieldTwo.borderStyle = .roundedRect
        textFieldTwo.textAlignment = .center
        textFieldTwo.placeholder = "Логин"
        textFieldTwo.delegate = textFieldDelegate
        textFieldTwo.addTarget(self, action: #selector(textFieldDidReturn), for: .editingDidEndOnExit)
    }
    
    func setupTextFieldThree () {
        textFieldThree.borderStyle = .roundedRect
        textFieldThree.textAlignment = .center
        textFieldThree.placeholder = "Пароль"
        textFieldThree.delegate = textFieldDelegate
        textFieldThree.addTarget(self, action: #selector(textFieldDidReturn), for: .editingDidEndOnExit)
    }
    
    @objc func textFieldDidReturn(_ textField: UITextField) {
        if let index = textFields.firstIndex(of: textField), index < textFields.count - 1 {
            // Если это не последнее поле, переходим к следующему полю
            textFields[index + 1].becomeFirstResponder()
        } else {
            // Если это последнее поле, скрываем клавиатуру
            textField.resignFirstResponder()
        }
    }
    
    func setupTextFieldOneConstraints() {
        textFieldOne.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = textFieldOne.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerY = textFieldOne.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let height = textFieldOne.heightAnchor.constraint(equalToConstant: 35)
        let width = textFieldOne.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([centerX, centerY, height, width])
    }
    
    func setupTextFieldTwoConstraints() {
        textFieldTwo.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = textFieldTwo.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let top = textFieldTwo.topAnchor.constraint(equalTo: textFieldOne.bottomAnchor, constant: 16)
        let height = textFieldTwo.heightAnchor.constraint(equalToConstant: 35)
        let width = textFieldTwo.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([centerX, top, height, width])
    }
    
    func setupTextFieldThreeConstraints() {
        textFieldThree.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = textFieldThree.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let top = textFieldThree.topAnchor.constraint(equalTo: textFieldTwo.bottomAnchor, constant: 16)
        let height = textFieldThree.heightAnchor.constraint(equalToConstant: 35)
        let width = textFieldThree.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([centerX, top, height, width])
    }
    
}
