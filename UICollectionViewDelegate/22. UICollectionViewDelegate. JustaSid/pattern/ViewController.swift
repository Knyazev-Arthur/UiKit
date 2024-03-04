import UIKit

class ViewController: UIViewController {
    
    private let userProfile: UserProfileView
    
    init() {
        self.userProfile = UserProfileView()
        super.init(nibName: nil, bundle: nil)
        self.userProfile.collectionViewDelegate.viewController = self // Устанавливаем viewController в collectionViewDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = userProfile
    }

}

