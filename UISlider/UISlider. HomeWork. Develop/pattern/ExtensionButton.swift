import UIKit

extension UIButton {
    
    func setupTapButton() {
        UIView.animate(withDuration: 0.1, animations: { // задержка 0.1 секунда
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) // размер кнопки 90%
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.identity // возврат размера в исходное состояние
            })
        }
    }
    
}
