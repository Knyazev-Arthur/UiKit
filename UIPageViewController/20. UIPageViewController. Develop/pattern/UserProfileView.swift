import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    
}

class UserCarView: UIView, UserProfileViewProtocol {

    init() {
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension UserCarView {
    
    func setupUserProfileView() {
        backgroundColor = UIColor(ciColor: .cyan)
    }
    
}
