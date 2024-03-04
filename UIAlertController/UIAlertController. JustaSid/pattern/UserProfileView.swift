import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var alertDelegate: AlertDelegateProtocol { get set }
    var textFieldDelegate: TextFieldDelegate { get set }
    var game: Game { get set }
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var textFieldDelegate: TextFieldDelegate
    var alertDelegate: AlertDelegateProtocol
    var game: Game
    private let button: UIButton
    
    init() {
        self.button = UIButton()
        self.alertDelegate = AlertDelegate()
        self.textFieldDelegate = TextFieldDelegate()
        self.game = Game()
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UserProfileView {
    
    func setupUserProfileView() {
        alertDelegate.userProfileView = self
        textFieldDelegate.userProfileView = self
        backgroundColor = .white
        setupButton()
        addSubview(button)
        setupButtonConstraints()
    }
    
    func setupButton() {
        button.backgroundColor = .red
        button.setTitle("Alert", for: .normal)
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
    }
    
    func setupButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = button.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerY = button.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let width = button.widthAnchor.constraint(equalToConstant: 150)
        let height = button.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([centerX, centerY, width, height])
    }
    
    @objc func startGame() {
        alertDelegate.showAlert()
    }    
}
