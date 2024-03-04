import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var textFieldDelegate: TextFieldDelegateProtocol { get set }
    var textField: UITextField { get set }
    var viewControllerDelegate: ViewController? { get set }
    var pickerViewDataSource: PickerViewDataSourceProtocol { set get }
    var pickerViewDelegate: PickerViewDelegateProtocol { set get }
    var number: [Int] { set get }
    var pickerView: UIPickerView { set get }
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var number = Array(1...3)
    var pickerViewDataSource: PickerViewDataSourceProtocol
    var pickerViewDelegate: PickerViewDelegateProtocol
    var textFieldDelegate: TextFieldDelegateProtocol
    var textField: UITextField
    var pickerView: UIPickerView
    weak var viewControllerDelegate: ViewController?
    
    private let shareButton: UIButton
    private var activityViewController: UIActivityViewController
    private let toolBar: UIToolbar
    
    init() {
        self.textFieldDelegate = TextFieldDelegate()
        self.textField = UITextField()
        self.shareButton = UIButton(type: .roundedRect)
        self.activityViewController = UIActivityViewController(activityItems: [], applicationActivities: nil)
        self.pickerView = UIPickerView()
        self.toolBar = UIToolbar()
        self.pickerViewDataSource = PickerViewDataSource()
        self.pickerViewDelegate = PickerViewDelegate()
        
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension UserProfileView {
    
    func setupUserProfileView() {
        pickerViewDataSource.profileUserView = self
        pickerViewDelegate.profileUserView = self
        backgroundColor = UIColor(ciColor: .cyan)
        
        setupTextField()
        setupShareButton()
        setupPickerView()
        
        addSubview(textField)
        addSubview(shareButton)
        
        setupTextFieldConstraints()
        setupShareButtonConstraints()
    }
    
    func setupTextField() {
        textFieldDelegate.userProfileView = self
        textField.delegate = textFieldDelegate
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text to share"
    }
    
    func setupShareButton() {
        shareButton.setTitle("Расшарить", for: .normal)
        shareButton.addTarget(self, action: #selector(hedleShare), for: .touchUpInside)
    }
    
    @objc func hedleShare() {
        if textField.text?.count == 0 { // если в textField отсутствует введенный текст, отображается окно с предупреждением
            let message = "Сначала введите текст, потом нажмите кнопку"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(action)
            viewControllerDelegate?.present(alertController, animated: true, completion: nil)
        }
        // объявляем UIActivityViewController с текстом из текстового поля в качестве общего ресурса.
        activityViewController = UIActivityViewController(activityItems: [textField.text as Any], applicationActivities: nil)
        // показываем UIActivityViewController, который предоставляет различные опции для общего доступа контента, такие как отправка через сообщения, электронную почту и другие способы, в зависимости от доступных приложений на устройстве.
        viewControllerDelegate?.present(activityViewController, animated: true, completion: nil)
    }
    
    func setupToolbarAge() {
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(agePickerDoneButtonTapped))
        toolBar.setItems([doneButton], animated: false)
    }
    
    @objc private func agePickerDoneButtonTapped() {
        textField.resignFirstResponder() // Закрываем клавиатуру
    }
    
    func setupPickerView() {
        pickerView.delegate = pickerViewDelegate
        pickerView.dataSource = pickerViewDataSource
        setupToolbarAge()
        textField.inputView = pickerView
        textField.inputAccessoryView = toolBar
    }
    
    func setupTextFieldConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = textField.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerY = textField.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let height = textField.heightAnchor.constraint(equalToConstant: 50)
        let width = textField.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([centerX, centerY, height, width])
    }
    
    func setupShareButtonConstraints() {
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = shareButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16)
        let centerX = shareButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let height = shareButton.heightAnchor.constraint(equalToConstant: 30)
        let width = shareButton.widthAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([centerX, top, height, width])
    }
}
