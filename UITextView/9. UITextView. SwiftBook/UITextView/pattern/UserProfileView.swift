import UIKit

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var textViewDelegate: TextViewDelegateProtocol
    let textView: UITextView
    var textViewBottomConstraint: NSLayoutConstraint
    let label: UILabel
    
    // объявляем собственный инициализатор для установки размеров экрана через констрейнты, а не через frame - как во встроенном
    init() {
        self.textViewDelegate = TextViewDelegate()
        self.textView = UITextView()
        self.textViewBottomConstraint = NSLayoutConstraint()
        self.label = UILabel()
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
        
        setupElementsConstrains()
        
    }
    
    private func setupElementsConstrains() {
        setupTextView()
        setupLabelConstraints()
        setupTextViewConstraints()
    }
    
    private func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false

        let top = label.topAnchor.constraint(equalTo: self.topAnchor, constant: 44)
        let leading = label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)
        let trailing = label.rightAnchor.constraint(lessThanOrEqualTo: self.rightAnchor, constant: -200)
        let bottom = label.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -37)

        NSLayoutConstraint.activate([top, leading, trailing, bottom])
    }
    
    private func setupTextViewConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let bottom = textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -117)
        
        NSLayoutConstraint.activate([leading, trailing, bottom])
        
        textViewBottomConstraint = bottom
    }
    
    private func setupTextView() {
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17) // меняем размер и стиль шрифта напрямую
        textView.backgroundColor = self.backgroundColor // устанавливаем цвет фона текстового поля равным цвету фона экрана
        textView.layer.cornerRadius = 10 // устанавливаем градус закругления углов текстового поля
        textView.textAlignment = .left // выравниваем текст по левому краю
        textView.text = ""
        textView.delegate = textViewDelegate // устанавливаем делегата для реализации методов UITextViewDelegate в отдельном файле
        textViewDelegate.userProfileView = self // инициализируем свойству userProfileView textViewDelegate настоящий экран для доступа к его методам и свойствам
    }
}

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol {
    var textViewDelegate: TextViewDelegateProtocol { get set }
}
