import UIKit

// MARK: PickerViewDelegateProtocol
protocol PickerViewDelegateProtocol: UIPickerViewDelegate {
    var userProfileView: UserProfileViewProtocol? { get set }
}

class PickerViewDelegate: NSObject, PickerViewDelegateProtocol {
    
    weak var userProfileView: UserProfileViewProtocol?
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == userProfileView?.colorPicker { // если pickerView можно привести к типу colorPicker
            return userProfileView?.colors[row] // вернем содержимое массива colors по индексу
        } else {
            return userProfileView?.lines[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == userProfileView?.colorPicker {
            switch row { // цвет зависит от выбранного индекса массива
                case 0: userProfileView?.colorTextLabel(.black)
                case 1: userProfileView?.colorTextLabel(.red)
                case 2: userProfileView?.colorTextLabel(.green)
                case 3: userProfileView?.colorTextLabel(.blue)
                default: userProfileView?.colorTextLabel(.black)
            }
        } else {
            userProfileView?.linesLabel(row)
        }
    }
}
