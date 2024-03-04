import UIKit

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var textViewDelegate: TextViewDelegateProtocol
    var textFieldDelegate: TextFieldDelegateProtocol
    var buttonLeftBottomConstraint: NSLayoutConstraint
    let textView: UITextView
    var mode: Mode
    
    private let labelTitle: UILabel
    private let labelDescription: UILabel
    private let textField: UITextField
    private let buttonRight: UIButton
    private let buttonLeft: UIButton
    
    init() {
        self.textViewDelegate = TextViewDelegate()
        self.textFieldDelegate = TextFieldDelegate()
        self.buttonLeftBottomConstraint = NSLayoutConstraint()
        self.labelTitle = UILabel()
        self.labelDescription = UILabel()
        self.textField = UITextField()
        self.textView = UITextView()
        self.buttonRight = UIButton()
        self.buttonLeft = UIButton()
        self.mode = .edit
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // метод, позволяющий отслеживать касания экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        endEditing(true) // при касании экрана вне области ввода текста произойдет скрытие клавиатуры
    }
    
}
    
private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = .white
        
        addSubview(labelTitle)
        addSubview(textField)
        addSubview(labelDescription)
        addSubview(textView)
        addSubview(buttonRight)
        addSubview(buttonLeft)
        
        keyboardWatchers()
        setupElements()
    }
    
    func setupElements() {
        
        setupLabelTitleConstraints()
        setupTextFieldConstraints()
        setupLabelDescriptionConstraints()
        setupTextViewConstraints()
        setupButtonRightConstraints()
        setupButtonLeftConstraints()
        
        setupLabelTitle()
        setupTextField()
        setupLabelDescription()
        setupTextView()
        setupButtonRight()
        setupButtonLeft()
    }
    
    func setupLabelTitleConstraints() {
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let top = labelTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leading = labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = labelTitle.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -200)
        let bottom = labelTitle.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -16)
        
        NSLayoutConstraint.activate([top,leading,trailing,bottom])
    }
    
    func setupTextFieldConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        NSLayoutConstraint.activate([leading,trailing])
    }
    
    func setupLabelDescriptionConstraints() {
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        
        let top = labelDescription.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16)
        let leading = labelDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = labelDescription.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -200)
        let bottom = labelDescription.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -16)
        
        NSLayoutConstraint.activate([top,leading,trailing,bottom])
    }
    
    func setupTextViewConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let bottom = textView.bottomAnchor.constraint(equalTo: buttonRight.topAnchor, constant: -16)
        
        NSLayoutConstraint.activate([leading,trailing,bottom])
    }
    
    func setupButtonRightConstraints() {
        buttonRight.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = buttonRight.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 280)
        let trailing = buttonRight.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let bottom = buttonRight.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
    
        NSLayoutConstraint.activate([leading,trailing,bottom])
    }
    
    func setupButtonLeftConstraints() {
        buttonLeft.translatesAutoresizingMaskIntoConstraints = false
        
        let top = buttonRight.topAnchor.constraint(equalTo: buttonRight.topAnchor)
        let leading = buttonLeft.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = buttonLeft.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -250)
        let bottom = buttonLeft.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
    
        NSLayoutConstraint.activate([top,leading,trailing,bottom])
        
        buttonLeftBottomConstraint = bottom
    }
    
    func setupLabelTitle() {
        labelTitle.text = "Title"
    }
    
    func setupTextField() {
        // textField.placeholder = "Поле для поста"
        textField.borderStyle = .none
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.gray.cgColor
        
        textField.delegate = textFieldDelegate
        textFieldDelegate.userProfileView = self
    }
    
    func setupLabelDescription() {
        labelDescription.text = "Description"
    }
    
    func setupTextView() {
        textView.text = """
        Всем привет, я Данила, реальный создатель apple.com и ya.sru. Моя мобила: 89061111111
        Swift provides many fundamental data types, including Int for integers, Double for floating-point values, Bool for Boolean values, and String for text. Swift also provides powerful versions of the three primary collection types, Array, Set, and Dictionary, as described in Collection Types.

        Swift uses variables to store and refer to values by an identifying name. Swift also makes extensive use of variables whose values can’t be changed. These are known as constants, and are used throughout Swift to make code safer and clearer in intent when you work with values that don’t need to change.

        In addition to familiar types, Swift introduces advanced types such as tuples. Tuples enable you to create and pass around groupings of values. You can use a tuple to return multiple values from a function as a single compound value.

        Swift also introduces optional types, which handle the absence of a value. Optionals say either “there is a value, and it equals x” or “there isn’t a value at all”.

        Swift is a type-safe language, which means the language helps you to be clear about the types of values your code can work with. If part of your code requires a String, type safety prevents you from passing it an Int by mistake. Likewise, type safety prevents you from accidentally passing an optional String to a piece of code that requires a non-optional String. Type safety helps you catch and fix errors as early as possible in the development process.
        """
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.dataDetectorTypes = [.link, .phoneNumber] // распознавание и подсветка данных
        // textView.isEditable = false // откл возможность редактирования текста
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        // textView.allowsEditingTextAttributes = true // разрешаем пользователю изменять стиль текста
        textView.font = UIFont.systemFont(ofSize: 16)
        // textView.keyboardDismissMode = .onDrag // сркытие клавитуры при скролинге
        
        // праметры тени подсветки
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.green
        shadow.shadowBlurRadius = 15
        
        textView.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.red, // цвет текста электронного адреса
            NSAttributedString.Key.shadow: shadow // тень
        ]
        
        textView.delegate = textViewDelegate
        textViewDelegate.userProfileView = self
    }
    
    func setupButtonRight() {
        buttonRight.setTitle("Preview", for: .normal)
        buttonRight.setTitleColor(.black, for: .normal)
        buttonRight.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    func setupButtonLeft() {
        buttonLeft.setTitle("to top", for: .normal)
        buttonLeft.setTitleColor(.blue, for: .normal)
        buttonLeft.addTarget(self, action: #selector(toTop), for: .touchUpInside)
    }
    
    @objc func toTop(_ sender: UIButton) { // метод для возврата в начало текста при скроллинге
        textView.scrollRangeToVisible(NSRange(location: 0, length: 0))
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        mode.togle()
        let buttonTitle = mode == .preview ? "Edit" : "Preview"
        let toValue: CGFloat = mode == .preview ? 0 : 1
        
        UIView.animate(withDuration: 1) {
            sender.setTitle(buttonTitle, for: .normal)
        }
        
        textField.animateBorderWidth(toValue: toValue, duration: 0.5)
        textView.animateBorderWidth(toValue: toValue, duration: 0.5)
        textView.isEditable = mode == .edit
        textField.isEnabled = mode == .edit
    }
    
    func keyboardWatchers() {
        // регистрация наблюдателя появления клавиатуры
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        // регистрация наблюдателя скрытия клавиатуры
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    // объявление метода, вызываемого при срабатывании наблюдателя
    @objc func updateTextView(notification: Notification) { //
        /* извлекаем словарь userIfo, содержащий информацию о клавиатуре, в т.ч. о ее размерах, которые нежны на определения расстояния, на которое потребуется поднять текст для того, чтобы его не перекрыла клавиатура */
        
        guard let userInfo = notification.userInfo as? [String : Any], //
        /* приводим тип словаря ([AnyHashable : Any]?) типу [String : Any]?, т.к. размер клавиатуры будет извлечен по ключу, который должен иметь текстовое значение */
            let keybordFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue //
        /* инициализируем константе извлеченные данные о размере клавиатуры */
            else { return }
        
        if notification.name == UIResponder.keyboardWillHideNotification { // если полученно уведомление о скрытии клавиатуры
            self.textView.contentInset = UIEdgeInsets.zero //
            /* возвращаем поднятый над клавиатурой текст на изначальную позицию (обнуялем размер на который поднимали текст) */
        } else { // если клавиатура появляется
            self.textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keybordFrame.height + buttonLeftBottomConstraint.constant, right: 0) // поднимаем текст
            self.textView.scrollIndicatorInsets = self.textView.contentInset // поднимаем индикатор прокрутки
        }
        
        textView.scrollRangeToVisible(textView.selectedRange) // определяем зону скроллинга
    }
    
}

// перечисление для переустановки ButtonRight
enum Mode {
    case preview, edit
    // метод для изменения значения Mode
    mutating func togle() {
        switch self {
        case .preview:
            self = .edit
        case .edit:
            self = .preview
        }
    }
}

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var buttonLeftBottomConstraint: NSLayoutConstraint { get }
    var textView: UITextView { get }
    var mode: Mode { get }
    var textViewDelegate: TextViewDelegateProtocol { get set }
    var textFieldDelegate: TextFieldDelegateProtocol { get set }
}
