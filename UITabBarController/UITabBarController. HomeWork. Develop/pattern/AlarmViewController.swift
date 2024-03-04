import UIKit

class AlarmViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBarItem() {
        tabBarItem = UITabBarItem(title: "Будильник", image: UIImage(systemName: "alarm"), tag: 1)
    }

}
