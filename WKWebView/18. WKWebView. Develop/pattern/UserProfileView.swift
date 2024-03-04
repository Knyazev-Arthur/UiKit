import UIKit
import WebKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: WKWebView {
    var textViewDelegate: TextViewDelegateProtocol { get set }
}
class UserWebView: WKWebView, UserProfileViewProtocol {
    
    var textViewDelegate: TextViewDelegateProtocol

    init() {
        self.textViewDelegate = TextViewDelegate()
        super.init(frame: .zero, configuration: .init())
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension UserWebView {
    
    func setupUserProfileView() {
        backgroundColor = UIColor(ciColor: .cyan)
    }
    
    
}
