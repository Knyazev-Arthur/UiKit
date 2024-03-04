import UIKit

// MARK: - TextViewDelegateProtocol
protocol TextFieldDelegateProtocol: UITextFieldDelegate {
    var userProfileView: UserProfileView? { get set }
}

class TextFieldDelegate: NSObject, TextFieldDelegateProtocol {
    weak var userProfileView: UserProfileView?
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing - решаю можно ли редактировать поле")
        
        if textField == userProfileView?.textField { // если textField можно привести к указанному типу
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing - я отслеживаю момент начала редактирования поле")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing - я отслеживаю момент когда пользователь покидает поле")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing - я отслеживаю момент")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn - я отслеживаю значения, которые вы вводите.\n Например - Вы ввели \(string)")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear - я отслеживаю момент, когда ты в поле что-то отчистил")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn - хотите убрать клавиатуру")
        
        if textField == userProfileView?.textField {
            userProfileView?.textField.resignFirstResponder() // на нажатию на ввод опускаем клавиатуру
        }
        return true
    }
    
}


