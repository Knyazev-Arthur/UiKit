import UIKit

// MARK: PickerViewDataSourceProtocol
protocol PickerViewDataSourceProtocol: UIPickerViewDataSource {
    var userProfileView: UserProfileViewProtocol? { get set }
}

class PickerViewDataSource: NSObject, PickerViewDataSourceProtocol {
    
    weak var userProfileView: UserProfileViewProtocol?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        userProfileView?.fontArray.count ?? 0
    }

}
