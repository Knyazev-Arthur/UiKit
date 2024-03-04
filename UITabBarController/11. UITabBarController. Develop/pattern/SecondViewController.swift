import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarItemCustom = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        tabBarItem = tabBarItemCustom
        
        navigationItem.title = "SecondVC"
        view.backgroundColor = .green
    }
    
}
