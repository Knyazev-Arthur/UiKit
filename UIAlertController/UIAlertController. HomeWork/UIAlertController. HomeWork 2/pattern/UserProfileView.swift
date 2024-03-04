import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var alertDelegate: AlertDelegateProtocol { get set }
    func labelModifiation(_ text: String)
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var alertDelegate: AlertDelegateProtocol
    
    private let buttonAddition: UIButton
    private let label: UILabel
    
    init() {
        self.buttonAddition = UIButton()
        self.label = UILabel()
        self.alertDelegate = AlertDelegate()
        
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func labelModifiation(_ text: String) {
        if label.text != nil {
            label.text! = text
        }
    }

}

private extension UserProfileView {
    
    func setupUserProfileView() {
        alertDelegate.userProfileView = self
        backgroundColor = UIColor(ciColor: .cyan)
        
        setupLabel()
        setupButtonAddition()
        
        addSubview(label)
        addSubview(buttonAddition)
        
        setupLabelConstraints()
        setupButtonAdditionConstraints()
    }
    
    func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let top = label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70)
        let height = label.heightAnchor.constraint(equalToConstant: 150)
        let leading = label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupButtonAdditionConstraints() {
        buttonAddition.translatesAutoresizingMaskIntoConstraints = false
        
        let top = buttonAddition.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100)
        let height = buttonAddition.heightAnchor.constraint(equalToConstant: 60)
        let centerX = buttonAddition.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = buttonAddition.widthAnchor.constraint(equalToConstant: 150)
        
        NSLayoutConstraint.activate([top, centerX, width, height])
    }
    
    func setupLabel() {
        label.text = ""
        label.shadowOffset.height = -1
        label.highlightedTextColor = .black
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
    }
    
    func setupButtonAddition() {
        buttonAddition.backgroundColor = .red
        buttonAddition.setTitle("Начать", for: .normal)
        buttonAddition.layer.borderColor = UIColor.black.cgColor
        buttonAddition.layer.borderWidth = 1
        buttonAddition.layer.cornerRadius = 5
        buttonAddition.addTarget(self, action: #selector(buttonAdditionAction), for: .touchUpInside)
        buttonAddition.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        buttonAddition.setTitleColor(.black, for: .normal)
    }
    
    @objc func buttonAdditionAction(_sender: UIButton) {
        alertDelegate.buttonAdditionTapped()
        
        UIView.animate(withDuration: 0.1, animations: {
            self.buttonAddition.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) // Уменьшаем масштаб кнопки при нажатии
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.buttonAddition.transform = CGAffineTransform.identity // Возвращаем обычный масштаб кнопки
            })
        }
    }
    
}
