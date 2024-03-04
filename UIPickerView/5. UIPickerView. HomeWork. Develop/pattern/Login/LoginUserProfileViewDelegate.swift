import UIKit

// MARK: LoginDelegateProtocol
protocol LoginDelegateProtocol {
    var loginViewController: LoginViewController? { get set }
    var loginUserProfileView: LoginUserProfileView? { get set }
}

class LoginDelegate: NSObject, LoginDelegateProtocol {
    
    weak var loginViewController: LoginViewController?
    weak var loginUserProfileView: LoginUserProfileView?
    
    
}
