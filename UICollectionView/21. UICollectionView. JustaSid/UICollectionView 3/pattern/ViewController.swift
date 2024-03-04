import UIKit

class ViewController: UIViewController {
    
    private let userProfileView: UserProfileViewProtocol
    
    init() {
        self.userProfileView = UserProfileView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = userProfileView
    }

}
