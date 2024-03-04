import UIKit

// MARK: PickerViewDataSourceProtocol
protocol PickerViewDataSourceProtocol: UIPickerViewDataSource {
    var profileUserView: ProfileUserView? { get set }
}

class PickerViewDataSource: NSObject, PickerViewDataSourceProtocol {
    
    weak var profileUserView: ProfileUserView?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == profileUserView?.pickerViewAge {
            return profileUserView?.ageData.count ?? 0
        } else {
            return profileUserView?.sexData.count ?? 0
        }
    }

}
