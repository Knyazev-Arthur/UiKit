import UIKit

// MARK: UserProfileViewDelegateProtocol
protocol AlertDelegateProtocol: UIView {
    var viewController: ViewController? { get set }
    var userProfileView: UserProfileViewProtocol? { get set }
    func showAlert()
}

class AlertDelegate: UIView, AlertDelegateProtocol {
    
    weak var userProfileView: UserProfileViewProtocol?
    weak var viewController: ViewController?
    
    func showAlert() {
        let alertController = UIAlertController(title: "Рулетка", message: "Отгадай число от 1 до 5", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            guard let answer = self.userProfileView?.game.answer else { return }
            guard let answer2 = self.userProfileView?.game.isRight(answer: answer) else { return }
            print(answer2)
        })
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
//        let destroyAction = UIAlertAction(
//            title: "destroy",
//            style: .destructive,
//            handler: nil)
        
        alertController.addTextField { textField in
            textField.delegate = self.userProfileView?.textFieldDelegate
            print("addTextField отработал")
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
//        alertController.addAction(destroyAction)
        
//        alertController.preferredAction = okAction // приоритет выделения кнопки
        viewController?.present(alertController, animated: true) {
            self.userProfileView?.game.generate()
        }
    }
    
}
