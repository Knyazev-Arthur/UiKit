import UIKit

class TabBarController: UITabBarController {
    
    private let secondVC: SecondViewController
    private let firstVC: FirstViewController
    private let secondNC: UINavigationController
    private let firstNC: UINavigationController
        
    init() {
        self.secondVC = SecondViewController()
        self.firstVC = FirstViewController()
        self.secondNC = UINavigationController(rootViewController: secondVC)
        self.firstNC = UINavigationController(rootViewController: firstVC)
        
        super.init(nibName: nil, bundle: nil)
        setupTabBarController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension TabBarController {
    
    func setupTabBarController() {
        setViewControllers([secondNC, firstNC], animated: true)
    }
    
}
