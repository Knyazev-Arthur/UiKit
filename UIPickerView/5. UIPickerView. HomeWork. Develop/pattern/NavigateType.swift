import UIKit

// MARK: - NavigateType
enum NavigateType {
    case push(viewController: UIViewController)
    case present(viewController: UIViewController)
    case bithdayViewController
}
