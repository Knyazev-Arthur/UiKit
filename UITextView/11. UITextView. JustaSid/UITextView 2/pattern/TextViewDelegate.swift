import UIKit

class TextViewDelegate: NSObject, TextViewDelegateProtocol {
    
    weak var userProfileView: UserProfileViewProtocol?
    
    func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        switch userProfileView?.mode {
        case .edit:
            return true
        default:
            return false
        }
    }
    
    // разрешение пользователю на переход по ссылке
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return true
    }
    
}

// MARK: - TextViewDelegateProtocol
protocol TextViewDelegateProtocol: UITextViewDelegate {
    var userProfileView: UserProfileViewProtocol? { get set }
}
