import UIKit

// MARK: - LoginViewControllerProtocol
protocol LoginViewControllerProtocol: AnyObject {
    func navigate(_ type: NavigateType)
}

class LoginViewController: UIViewController, LoginViewControllerProtocol {
    
    private let router: LoginRouterProtocol
    private let loginUserProfileView: LoginUserProfileViewProtocol
    
    init() {
        self.router = Router()
        self.loginUserProfileView = LoginUserProfileView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = loginUserProfileView
        router.navigationController = navigationController
        loginUserProfileView.delegate = self
    }
    
    func navigate(_ type: NavigateType) {
        switch type {
            case .push(let viewController):
                router.push(viewController)
            case .present(let viewController):
                router.present(viewController)
            case .bithdayViewController:
                router.pushBirthdayViewController()
        }
    }
    
    
}

