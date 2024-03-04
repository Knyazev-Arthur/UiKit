import UIKit

class TextFieldDelegate: NSObject, TextFieldDelegateProtocol {
    
    weak var userProfileView: UserProfileViewProtocol?
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let number = Int(text) {
            userProfileView?.game.answer = number
        }
    }
    
}

// MARK: - TextFieldDelegateProtocol
protocol TextFieldDelegateProtocol: UITextFieldDelegate {
    var userProfileView: UserProfileViewProtocol? { get set }
}
