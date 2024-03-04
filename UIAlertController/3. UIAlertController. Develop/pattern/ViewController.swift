import UIKit

class ViewController: UIViewController {
    
    private let userProfileView: UserProfileViewProtocol
    
    init() {
        userProfileView = UserProfileView()
        super.init(nibName: nil, bundle: nil)
        userProfileView.alertDelegate.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = userProfileView
    }
}
