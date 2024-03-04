import UIKit

// MARK: PlayerViewControllerProtocol
protocol PlayerViewControllerProtocol: UIViewController {
    var playerProfileView: PlayerProfileViewProtocol { get set }
}

class PlayerViewController: UIViewController, PlayerViewControllerProtocol {
    
    var playerProfileView: PlayerProfileViewProtocol
    
    init() {
        playerProfileView = PlayerProfileView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = playerProfileView
    }

}
