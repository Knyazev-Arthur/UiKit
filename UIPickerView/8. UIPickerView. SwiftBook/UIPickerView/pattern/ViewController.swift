import UIKit

class ViewController: UIViewController {
    
    private var pickerViewLabel = UILabel()
    private let uiElements = ["labelOne","labelTwo"]
    private var selectedElement: String?
    private let userProfileView = UserProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userProfileView)
        setupUserProfileViewConstraints()
        
        userProfileView.delegatePickerView(delegate: self, dataSourse: self)
    }

    private func setupUserProfileViewConstraints() {
        userProfileView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = userProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailing = userProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let top = userProfileView.topAnchor.constraint(equalTo: view.topAnchor)
        let bottom = userProfileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { // кол-во барабанов
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { // кол-во элементов в барабане
        return uiElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { // выбор элемента
        return uiElements[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = uiElements[row]
        userProfileView.textField.text = selectedElement
        
        switch row {
        case 0:
            userProfileView.hideAllElement()
            userProfileView.hideLabelOne()
        case 1:
            userProfileView.hideAllElement()
            userProfileView.hideLabelTwo()
        default:
            userProfileView.hideAllElement()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 30)
        pickerViewLabel.text = uiElements[row]
        
        return pickerViewLabel
    }
}
