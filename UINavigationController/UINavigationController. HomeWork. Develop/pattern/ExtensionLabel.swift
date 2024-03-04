import UIKit

extension UILabel {
    func setupLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .systemBlue
        label.numberOfLines = 0
        return label
    }
}
