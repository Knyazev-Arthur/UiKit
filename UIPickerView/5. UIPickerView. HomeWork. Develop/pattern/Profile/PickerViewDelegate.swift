import UIKit

// MARK: PickerViewDelegateProtocol
protocol PickerViewDelegateProtocol: UIPickerViewDelegate {
    var profileUserView: ProfileUserView? { get set }
}

class PickerViewDelegate: NSObject, PickerViewDelegateProtocol {
    
    weak var profileUserView: ProfileUserView?
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == profileUserView?.pickerViewAge {
            let ageData = profileUserView?.ageData ?? [0]
            return "\(ageData[row])"
        } else {
            let sexData = profileUserView?.sexData ?? [""]
            return "\(sexData[row])"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == profileUserView?.pickerViewAge {
            let ageData = profileUserView?.ageData ?? [0]
            profileUserView?.setupTextFieldAgeText("\(ageData[row])")
        } else {
            let sexData = profileUserView?.sexData ?? [""]
            profileUserView?.setupTextFieldSexText("\(sexData[row])")

        }
        
    }
}
