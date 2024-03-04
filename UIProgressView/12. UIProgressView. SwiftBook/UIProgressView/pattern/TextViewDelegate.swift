import UIKit

class TextViewDelegate: NSObject, TextViewDelegateProtocol {
    weak var userProfileView: UserProfileView?
    
    // метод, отслеживающий момент начала редактирования текстового поля
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
    }
    // метод, отслеживающий момент конец редактирования текстового поля
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = userProfileView?.backgroundColor
    }
    // метод для подсчета кол-ва символов
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        userProfileView?.label.text = "\(textView.text.count)"
        return textView.text.count + (text.count + range.length) <= 60
    }
}

// MARK: - TextViewDelegateProtocol
protocol TextViewDelegateProtocol: UITextViewDelegate {
    var userProfileView: UserProfileView? { get set }
}
