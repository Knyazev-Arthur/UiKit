import UIKit

// MARK: PickerViewDataSourceProtocol
protocol PickerViewDataSourceProtocol: UIPickerViewDataSource {
    var profileUserView: UserProfileView? { get set }
}

class PickerViewDataSource: NSObject, PickerViewDataSourceProtocol {
    
    weak var profileUserView: UserProfileView?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        profileUserView?.number.count ?? 0
    }
    

}
