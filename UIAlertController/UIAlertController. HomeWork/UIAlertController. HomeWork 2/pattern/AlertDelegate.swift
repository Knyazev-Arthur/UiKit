import UIKit

// MARK: UserProfileViewDelegateProtocol
protocol AlertDelegateProtocol: UIAlertController {
    var viewController: ViewController? { get set }
    var userProfileView: UserProfileViewProtocol? { get set }
    func buttonAdditionTapped()
}

class AlertDelegate: UIAlertController, AlertDelegateProtocol {
    
    weak var userProfileView: UserProfileViewProtocol?
    weak var viewController: ViewController?
    
    func buttonAdditionTapped() {
        let alertController = UIAlertController(title: "Введите слово", message: nil, preferredStyle: .alert)
        
        let randomNumber = UIAlertAction(title: "Отправить", style: .default) { _ in
            randomResult(alertController)
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "Слово"
        }
        
        alertController.addAction(randomNumber)
        viewController?.present(alertController, animated: true, completion: nil)
        
        func randomResult(_ alertController: UIAlertController) {
            let textField1 = alertController.textFields?.first
            let number = textField1?.text ?? ""
            
            let result = number == "leohl" ? true : false
            if result {
                self.userProfileView?.labelModifiation("Hello")
            } else {
                self.userProfileView?.labelModifiation("GoodBye")
            }
        }
        
    }
    
}
