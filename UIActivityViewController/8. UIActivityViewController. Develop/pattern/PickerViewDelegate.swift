import UIKit

// MARK: PickerViewDelegateProtocol
protocol PickerViewDelegateProtocol: UIPickerViewDelegate {
    var profileUserView: UserProfileView? { get set }
}

class PickerViewDelegate: NSObject, PickerViewDelegateProtocol {
    
    weak var profileUserView: UserProfileView?
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let number = profileUserView?.number ?? [0]
        return "\(number[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if row == 2 {
            let activityViewController = UIActivityViewController(activityItems: [profileUserView?.textField.text as Any], applicationActivities: nil)
            // показываем UIActivityViewController, который предоставляет различные опции для общего доступа контента, такие как отправка через сообщения, электронную почту и другие способы, в зависимости от доступных приложений на устройстве.
            profileUserView?.viewControllerDelegate?.present(activityViewController, animated: true, completion: nil)
        }
        
    }
}
