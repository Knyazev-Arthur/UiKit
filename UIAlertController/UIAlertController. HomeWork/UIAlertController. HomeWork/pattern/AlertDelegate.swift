import UIKit

// MARK: UserProfileViewDelegateProtocol
protocol AlertDelegateProtocol: UIAlertController {
    var viewController: ViewController? { get set }
    var userProfileView: UserProfileViewProtocol? { get set }
    func alert()
    func buttonAdditionTapped()
    func buttonRundomTapped()
}

class AlertDelegate: UIAlertController, AlertDelegateProtocol {
    
    weak var userProfileView: UserProfileViewProtocol?
    weak var viewController: ViewController?
    
    func alert() {
        let alertController = UIAlertController(title: "Внимание", message: "Введите Ваше ФИО", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default) { _ in
            let textField = alertController.textFields?.first // получаем первый элемент (текстовое поле) из массива в UIAlertController
            let text = textField?.text ?? ""
            self.userProfileView?.labelModifiation("Добрый день, " + text + "!\nЧто выберите?")
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "ФИО"
        }
        
        alertController.addAction(okAction)
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    func buttonAdditionTapped() {
        let alertController = UIAlertController(title: "Введите число", message: nil, preferredStyle: .alert)
        
        let calculateAction = UIAlertAction(title: "Посчитать", style: .default) { _ in
            calculateResult(alertController)
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "Число 1"
            textField.keyboardType = .numberPad
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "Число 2"
            textField.keyboardType = .numberPad
        }
        
        alertController.addAction(calculateAction)
        viewController?.present(alertController, animated: true, completion: nil)
        
        func calculateResult(_ alertController: UIAlertController) {
            let textField1 = alertController.textFields?.first
            let textField2 = alertController.textFields?.last
            
            let number1 = Int(textField1?.text ?? "") ?? 0
            let number2 = Int(textField2?.text ?? "") ?? 0
            let result = number1 + number2
            
            let resultAlert = UIAlertController(title: "Результат", message: "Сумма \(result)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            resultAlert.addAction(okAction)
            
            self.viewController?.present(resultAlert, animated: true, completion: nil)
        }
        
    }
    
    func buttonRundomTapped() {
        let alertController = UIAlertController(title: "Угадайте число от 1 до 5", message: nil, preferredStyle: .alert)
        
        let randomNumber = UIAlertAction(title: "Выбрать", style: .default) { _ in
            randomResult(alertController)
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "Число от 1 до 5"
            textField.keyboardType = .numberPad
        }
        
        alertController.addAction(randomNumber)
        viewController?.present(alertController, animated: true, completion: nil)
        
        
        func randomResult(_ alertController: UIAlertController) {
            let secret = Int.random(in: 1...5)
            let textField1 = alertController.textFields?.first
            let number = Int(textField1?.text ?? "") ?? 0
            
            let result = secret == number ? "Вы угадали" : "Неверно"
            
            let resultAlert = UIAlertController(title: "Результат", message: "\(result)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            resultAlert.addAction(okAction)
            
            self.viewController?.present(resultAlert, animated: true, completion: nil)
        }
    }
    
}
