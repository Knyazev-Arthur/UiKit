import UIKit

// MARK: PickerViewDelegateProtocol
protocol PickerViewDelegateProtocol: UIPickerViewDelegate {
    var userProfileView: UserProfileViewProtocol? { get set }
}

class PickerViewDelegate: NSObject, PickerViewDelegateProtocol {
    
    weak var userProfileView: UserProfileViewProtocol?
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        userProfileView?.fontArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let size = userProfileView?.currentValueFontSlider() else { return }
        
        switch row { // цвет зависит от выбранного индекса массива
        case 0:
            guard let font = UIFont(name: "Helvetica Neue", size: size) else { return }
            userProfileView?.fontTextView(font)
        case 1:
            guard let font = UIFont(name: "Arial", size: size) else { return }
            userProfileView?.fontTextView(font)
        case 2:
            guard let font = UIFont(name: "Times New Roman", size: size) else { return }
            userProfileView?.fontTextView(font)
        case 3:
            guard let font = UIFont(name: "Courier New", size: size) else { return }
            userProfileView?.fontTextView(font)
        default: break
        }
    }
}
