import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    private let label: UILabel
    
    init() {
        self.label = UILabel()
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = UIColor(ciColor: .cyan)
        
        setupLabel()
        
        addSubview(label)
        
        setupLabelConstraints()
    }
    
    func setupLabel() {
        label.text = "iOS 13 end Xcode 11 and The Swift Developers" // надпись в лейбле
        label.font = UIFont.boldSystemFont(ofSize: 18) // размер и стиль текста
        label.textAlignment = .center // размещение текста в лейбле
        label.sizeToFit()
//        label.adjustsFontSizeToFitWidth = true // уменьшение шрифта в случае непомещения текста в лейбле
//        label.minimumScaleFactor = 0.5 // минимальный масштабный коэффициент
        label.lineBreakMode = .byWordWrapping // указываем, как должен обрываться текст, в случае, если он не помещается в лейбл
        label.numberOfLines = 0 // разрешаем тексту переноситься на новые строки
//        label.layer.borderColor = UIColor.black.cgColor // цвет рамки
//        label.layer.borderWidth = 2 // ширина рамки
        label.textColor = .black // цвет текста
        label.shadowColor = .lightGray // цвет тени
        label.shadowOffset = CGSize(width: 2, height: 2) // отклонение тени для ее наглядности
    }
    
    func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerY = label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let height = label.heightAnchor.constraint(equalToConstant: 100)
        let width = label.widthAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([centerX, centerY, height, width])
    }
}
