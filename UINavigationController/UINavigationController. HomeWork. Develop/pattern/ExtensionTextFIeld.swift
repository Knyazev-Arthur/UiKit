import UIKit

extension UITextField {
    func setupLineTextField() -> UITextField {
        let textField = UITextField()
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.masksToBounds = false
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowOffset = CGSize(width: self.frame.width, height: 1)
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowRadius = 0.0
        return textField
    }
}
