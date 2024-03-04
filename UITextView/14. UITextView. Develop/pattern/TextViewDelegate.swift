import UIKit

// MARK: - TextViewDelegateProtocol
protocol TextViewDelegateProtocol: UITextViewDelegate {
    var userProfileView: UserProfileView? { get set }
}

class TextViewDelegate: NSObject, TextViewDelegateProtocol {
    weak var userProfileView: UserProfileView?
}
