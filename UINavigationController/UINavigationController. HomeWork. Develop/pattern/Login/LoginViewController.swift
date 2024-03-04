import UIKit

class LoginViewController: UIViewController {
    
    private let loginView: LoginViewProtocol
    
    init() {
        loginView = LoginView()
        super.init(nibName: nil, bundle: nil)
        loginView.loginViewControllerDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = loginView
    }

}
