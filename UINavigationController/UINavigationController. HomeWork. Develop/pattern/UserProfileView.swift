import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var loginViewControllerDelegate: LoginViewController? { get set }
}

class LoginView: UIView, UserProfileViewProtocol {
    
    weak var loginViewControllerDelegate: LoginViewController?

    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension LoginView {
    
    func setupView() {
        backgroundColor = UIColor(ciColor: .cyan)

    }
    
}
