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
        self.endEditing(true) // при касании экрана вне области ввода текста произойдет скрытие клавиатуры
    }
    
    private func setupUserProfileView() {
        backgroundColor = .white
        
        addSubview(labelTitle)
        addSubview(textField)
        addSubview(labelDescription)
        addSubview(textView)
        addSubview(buttonRight)
        addSubview(buttonLeft)
        
        setupElements()
    }
    
    private func setupElements() {
        
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
    
    private func setupLabelTitleConstraints() {
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let top = labelTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leading = labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = labelTitle.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -200)
        let bottom = labelTitle.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -16)
        
        NSLayoutConstraint.activate([top,leading,trailing,bottom])
    }
    
    private func setupTextFieldConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        NSLayoutConstraint.activate([leading,trailing])
    }
    
    private func setupLabelDescriptionConstraints() {
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        
        let top = labelDescription.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16)
        let leading = labelDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = labelDescription.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -200)
        let bottom = labelDescription.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -16)
        
        NSLayoutConstraint.activate([top,leading,trailing,bottom])
    }
    
    private func setupTextViewConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let bottom = textView.bottomAnchor.constraint(equalTo: buttonRight.topAnchor, constant: -16)
        
        NSLayoutConstraint.activate([leading,trailing,bottom])
    }
    
    private func setupButtonRightConstraints() {
        buttonRight.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = buttonRight.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 280)
        let trailing = buttonRight.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let bottom = buttonRight.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
    
        NSLayoutConstraint.activate([leading,trailing,bottom])
    }
    
    private func setupButtonLeftConstraints() {
        buttonLeft.translatesAutoresizingMaskIntoConstraints = false
        
        let top = buttonRight.topAnchor.constraint(equalTo: buttonRight.topAnchor)
        let leading = buttonLeft.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = buttonLeft.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -250)
        let bottom = buttonLeft.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
    
        NSLayoutConstraint.activate([top,leading,trailing,bottom])
        
        buttonLeftBottomConstraint = bottom
    }
    
    private func setupLabelTitle() {
        labelTitle.text = "Title"
    }
    
    private func setupTextField() {
        // textField.placeholder = "Поле для поста"
        textField.borderStyle = .none
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.gray.cgColor
        
        textField.delegate = textFieldDelegate
        textFieldDelegate.userProfileView = self
    }
    
    private func setupLabelDescription() {
        labelDescription.text = "Description"
    }
    
    private func setupTextView() {
        textView.text = """
        Всем привет, я Данила, реальный создатель apple.com и ya.ru. Моя мобила: 89061111111
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
    
    private func setupButtonRight() {
        buttonRight.setTitle("Preview", for: .normal)
        buttonRight.setTitleColor(.black, for: .normal)
        buttonRight.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    private func setupButtonLeft() {
        buttonLeft.setTitle("to top", for: .normal)
        buttonLeft.setTitleColor(.blue, for: .normal)
        buttonLeft.addTarget(self, action: #selector(toTop), for: .touchUpInside)
    }
    
    @objc private func toTop(_ sender: UIButton) { // метод для возврата в начало текста при скроллинге
        textView.scrollRangeToVisible(NSRange(location: 0, length: 0))
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
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

extension UIView {
    // метод настройки анимации рамок
    func animateBorderWidth(toValue: CGFloat, duration: Double) { // toValue - значение ширины рамки, duration - длительность анимации
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "borderWidth") // объект анимации для свойства borderWidth у слоя (layer) UserProfileView. keyPath указывает, какое свойство будет анимироваться - ширина рамки
        animation.fromValue = layer.borderWidth // начальное значение анимации (fromValue) устанавливается на текущее значение ширины границы слоя layer
        animation.toValue = toValue // конечное значение анимации устанавливается на передаваемое значение
        animation.duration = duration // длительность анимации устанавливается на передаваемое значение
        layer.add(animation, forKey: "Width") // добавляем анимацию к слою layer UserProfileView. forKey - ключ для идентификации
        layer.borderWidth = toValue // финальное значение ширины после анимации
    }
}

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol {
    var textViewDelegate: TextViewDelegateProtocol { get set }
    var textFieldDelegate: TextFieldDelegateProtocol { get set }
}
