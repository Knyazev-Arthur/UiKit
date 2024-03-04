import UIKit

class TimerViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBarItem() {
        tabBarItem = UITabBarItem(title: "Таймер", image: UIImage(systemName: "timer"), tag: 2)
    }
}
