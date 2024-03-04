import UIKit

class TextFieldDelegate: NSObject, TextFieldDelegateProtocol {
    
    weak var userProfileView: UserProfileViewProtocol?
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch userProfileView?.mode {
            case .edit:
                return true
            
            default:
                return false
        }
    }
    
}

// MARK: - TextFieldDelegateProtocol
protocol TextFieldDelegateProtocol: UITextFieldDelegate {
    var userProfileView: UserProfileViewProtocol? { get set }
}
