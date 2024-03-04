import UIKit

class TextViewDelegate: NSObject, TextViewDelegateProtocol {
    weak var userProfileView: UserProfileView?
}

// MARK: - TextViewDelegateProtocol
protocol TextViewDelegateProtocol: UITextViewDelegate {
    var userProfileView: UserProfileView? { get set }
}
