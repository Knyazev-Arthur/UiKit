import UIKit

// MARK: - LoginRouterProtocol
protocol LoginRouterProtocol: AnyObject {
    var navigationController: UINavigationController? { get set }
    func present(_ viewController: UIViewController)
    func push(_ viewController: UIViewController)
    func pushBirthdayViewController()
}

class Router: LoginRouterProtocol {
    
    weak var navigationController: UINavigationController?
    
    func present(_ viewController: UIViewController) {
        navigationController?.present(viewController, animated: true)
    }
    
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushBirthdayViewController() {
        let viewController = BirthdayViewController()
        push(viewController)
    }
    
}

