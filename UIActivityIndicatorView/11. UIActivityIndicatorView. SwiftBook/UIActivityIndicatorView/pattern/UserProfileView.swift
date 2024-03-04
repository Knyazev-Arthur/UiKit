import UIKit

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var textViewDelegate: TextViewDelegateProtocol
    let textView: UITextView
    var textViewBottomConstraint: NSLayoutConstraint
    let label: UILabel
    let stepper: UIStepper
    let activityIndicator: UIActivityIndicatorView
    
    init() {
        self.textViewDelegate = TextViewDelegate()
        self.textView = UITextView()
        self.textViewBottomConstraint = NSLayoutConstraint()
        self.label = UILabel()
        self.stepper = UIStepper()
        self.activityIndicator = UIActivityIndicatorView()
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
        addSubview(activityIndicator)
        
        setupElements()
    }
    
    private func setupElements() {
        setupLabelConstraints()
        setupTextViewConstraints()
        setupStepperConstraints()
        setupActivityIndicatorConstraints()
        
        setupTextView()
        setupStepper()
        setupActivityIndicator()
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
    
    private func setupActivityIndicatorConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        let centerY = activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let centerX = activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        
        NSLayoutConstraint.activate([centerY,centerX])
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
        textView.isHidden = true // выкл отображение текста при запуске программы
        textView.alpha = 0 // делаем текст невидимым (нахер не нужно, но автор сказал)
    }
    
    private func setupStepper() {
        stepper.value = 17
        stepper.minimumValue = 10
        stepper.maximumValue = 25
        stepper.tintColor = .white
        stepper.backgroundColor = .gray
        stepper.addTarget(self, action: #selector(sizeFont), for: .valueChanged)
    }
    
    private func setupActivityIndicator() {
        activityIndicator.hidesWhenStopped = true // выключаем отображение индикатора по истечению времение его работы
        activityIndicator.color = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        activityIndicator.startAnimating() // запуск индикатора при запуске приложения
        self.stepper.isUserInteractionEnabled = false // замораживаем интерфейс на время работы индикатора
        /* Метод выполняет анимацию, которая изменяет прозрачность текстового поля на полную видимость, останавливает индикатор активности и делает текстовое поле видимым, а также разрешает взаимодействие с элементом stepper после завершения анимации.*/
        UIView.animate(withDuration: 0, delay: 5, options: .curveEaseIn, animations: {
            self.textView.alpha = 1
        }) { (finished) in
            self.activityIndicator.stopAnimating()
            self.textView.isHidden = false
            self.stepper.isUserInteractionEnabled = true
        }
    }
    
    @objc private func sizeFont(_ sender: UIStepper) {
        guard let font = textView.font?.fontName else { return }// инициализируем константе размер текущего шрифта
        let fontSize = CGFloat(sender.value) // инициализируем константе размер шрифта равным значению stepper
        textView.font = UIFont(name: font, size: fontSize) // устанавливаем новый шрифт
    }
}

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol {
    var textViewDelegate: TextViewDelegateProtocol { get set }
}
