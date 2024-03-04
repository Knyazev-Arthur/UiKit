import UIKit

class FirstViewController: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarItemCustom = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        tabBarItem = tabBarItemCustom
        
        navigationItem.title = "FirstVC"
        view.backgroundColor = .blue
    }
    
}
