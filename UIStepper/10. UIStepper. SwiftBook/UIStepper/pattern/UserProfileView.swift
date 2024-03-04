import UIKit

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var textViewDelegate: TextViewDelegateProtocol
    let textView: UITextView
    var textViewBottomConstraint: NSLayoutConstraint
    let label: UILabel
    let stepper: UIStepper
    
    init() {
        self.textViewDelegate = TextViewDelegate()
        self.textView = UITextView()
        self.textViewBottomConstraint = NSLayoutConstraint()
        self.label = UILabel()
        self.stepper = UIStepper()
        super.init(frame: .zero)
        
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserProfileView() {
        backgroundColor = .green
        
        addSubview(label)
        addSubview(textView)
        addSubview(stepper)
        
        setupElements()
    }
    
    private func setupElements() {
        setupLabelConstraints()
        setupTextViewConstraints()
        setupStepperConstraints()
        setupTextView()
        setupStepper()
    }
    
    private func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false

        let top = label.topAnchor.constraint(equalTo: self.topAnchor, constant: 44)
        let leading = label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let bottom = label.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -37)

        NSLayoutConstraint.activate([top, leading, bottom])
    }
    
    private func setupTextViewConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let bottom = textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -117)
        
        NSLayoutConstraint.activate([leading, trailing, bottom])
        
        textViewBottomConstraint = bottom
    }
    
    private func setupStepperConstraints() {
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stepper.topAnchor.constraint(equalTo: self.topAnchor, constant: 44)
        let leading = stepper.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 255)
        let bottom = stepper.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -37)
        
        
        NSLayoutConstraint.activate([top,leading,bottom])
    }
    
    private func setupTextView() {
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        textView.backgroundColor = self.backgroundColor
        textView.layer.cornerRadius = 10
        textView.textAlignment = .left
        textView.text = ""
        textView.delegate = textViewDelegate
        textViewDelegate.userProfileView = self
        textView.text = "asdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdasdsad"
    }
    
    private func setupStepper() {
        stepper.value = 17
        stepper.minimumValue = 10
        stepper.maximumValue = 25
        stepper.tintColor = .white
        stepper.backgroundColor = .gray
        stepper.addTarget(self, action: #selector(sizeFont), for: .valueChanged)
    }
    
    @objc private func sizeFont(_ sender: UIStepper) {
        guard let font = textView.font?.fontName else { return }// инициализируем константе размер текущего шрифта
        let fontSize = CGFloat(sender.value) // инициализируем константе размер шрифта равным значению stepper
        
        textView.font = UIFont(name: font, size: fontSize) // устанавливаем новый шрифт
        // print("Stepper value changed to: \(sender.value)") // метод для проверки вызова мтеода
    }
}

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol {
    var textViewDelegate: TextViewDelegateProtocol { get set }
}
