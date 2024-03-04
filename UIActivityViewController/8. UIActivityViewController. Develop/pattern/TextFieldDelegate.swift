import UIKit

// MARK: - TextFieldDelegateProtocol
protocol TextFieldDelegateProtocol: UITextFieldDelegate {
    var userProfileView: UserProfileView? { get set }
}

class TextFieldDelegate: NSObject, TextFieldDelegateProtocol {
    weak var userProfileView: UserProfileView?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userProfileView?.textField.resignFirstResponder() ?? false
    }
}
