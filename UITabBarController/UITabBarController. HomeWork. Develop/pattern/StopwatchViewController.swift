import UIKit

class StopwatchViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBarItem() {
        tabBarItem = UITabBarItem(title: "Секундомер", image: UIImage(systemName: "stopwatch"), tag: 2)
    }
    
}
