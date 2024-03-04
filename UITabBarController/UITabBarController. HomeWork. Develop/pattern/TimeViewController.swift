import UIKit

class TimeViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBarItem() {
        tabBarItem = UITabBarItem(title: "Мировые часы", image: UIImage(systemName: "globe"), tag: 0)
    }
    
}
