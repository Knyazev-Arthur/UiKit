import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var textViewDelegate: TextViewDelegateProtocol { get set }
}
class UserProfileView: UIView, UserProfileViewProtocol {
    
    var textViewDelegate: TextViewDelegateProtocol

    private let textView: UITextView
    private let label: UILabel
    
    init() {
        self.textView = UITextView()
        self.label = UILabel()
        self.textViewDelegate = TextViewDelegate()
        
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = UIColor(ciColor: .cyan)
    }
}
