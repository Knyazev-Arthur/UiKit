import UIKit

extension UIButton {
    func makeMePushButton() {
        self.setTitle("Push", for: .normal)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .red
    }
    
    func makeMePopButton() {
        self.setTitle("Pop", for: .normal)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .blue
    }
    
    func makeMePopToRoot() {
        self.setTitle("Pop", for: .normal)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .green
    }
}
