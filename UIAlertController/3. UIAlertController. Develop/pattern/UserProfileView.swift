import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var alertDelegate: AlertDelegateProtocol { get set }
    func labelModifiation(_ text: String)
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var alertDelegate: AlertDelegateProtocol
    private let button: UIButton
    private let label: UILabel
    
    init() {
        self.button = UIButton()
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
            label.text! += text
        }
    }
    
}

private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = UIColor(ciColor: .cyan)

        alertDelegate.userProfileView = self
        
        setupButton()
        setupLabel()
        
        addSubview(button)
        addSubview(label)
        
        setupButtonConstraints()
        setupLabelConstraints()
    }
    
    func setupButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = button.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerY = button.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let width = button.widthAnchor.constraint(equalToConstant: 150)
        let height = button.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([centerY, centerX, width, height])
    }
    
    func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let height = label.heightAnchor.constraint(equalToConstant: 100)
        let bottom = label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -40)
        let leading = label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        NSLayoutConstraint.activate([height, bottom, leading, trailing])
    }
    
    func setupButton() {
        button.backgroundColor = .red
        button.setTitle("Show", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    func setupLabel() {
        label.shadowOffset.height = -1
        label.highlightedTextColor = .black
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        label.text = ""
        alertDelegate.alert(title: "Внимание", message: "Введите Вашей имя", style: .alert)
    }
}
