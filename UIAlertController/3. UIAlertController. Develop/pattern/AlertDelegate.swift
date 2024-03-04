import UIKit

// MARK: UserProfileViewDelegateProtocol
protocol AlertDelegateProtocol: UIAlertController {
    var viewController: ViewController? { get set }
    var userProfileView: UserProfileViewProtocol? { get set }
    func alert(title: String, message: String, style: UIAlertController.Style)
}

class AlertDelegate: UIAlertController, AlertDelegateProtocol {
    
    weak var userProfileView: UserProfileViewProtocol?
    weak var viewController: ViewController?
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let action = UIAlertAction(title: "ok", style: .default) { action in
            let textField = alertController.textFields?.first
            let text = textField?.text ?? ""
            self.userProfileView?.labelModifiation("Hi, " + text + "!")
        }
        
        alertController.addTextField { textField in
//            textField.isSecureTextEntry = true // скрытие вводимых символов
        }
        
        alertController.addAction(action)
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
}
