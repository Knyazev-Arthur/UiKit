import UIKit

class TabBarController: UITabBarController {
    
    let controller = UIViewController()
    let otherViewController = UIViewController()
    let oneMoreVIewController = UIViewController()
    let oneMoreVIewController2 = UIViewController()
    let oneMoreVIewController3 = UIViewController()
    let oneMoreVIewController4 = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad() // вызов родительского метода для настройки необходимых для стабильной работы параметров
        setupMain()
    }

}

private extension TabBarController {
    
    func setupMain() {
        view.backgroundColor = .white
        // tabBar вмещает только 5 tabBarItem. При кол-ве больше 5 будет отобржено доп меню с возможностью перестановки tabBarItem
        viewControllers = [controller, otherViewController, oneMoreVIewController, oneMoreVIewController2, oneMoreVIewController3, oneMoreVIewController4]
//        selectedIndex = 2 // выбор TabBar при запуске приложения по индексу
        selectedViewController = controller // выбор TabBar при запуске приложения по названию
        selectedViewController?.view.backgroundColor = .red // установка цвета фона TabBar, выбранному при запуске приложения
        self.tabBar.isTranslucent = false // откл прозрачность tubBar. Для того, чтобы содержимое контроллеров представлений не было видно через таб-панель
        self.tabBar.tintColor = UIColor(red: 0.7, green: 0.5, blue: 0.5, alpha: 1) // цвет активных item
        self.tabBar.unselectedItemTintColor = UIColor(red: 0.5, green: 0.7, blue: 0.5, alpha: 1) // цвет неактивных item
        self.tabBar.backgroundColor = UIColor(white: 1, alpha: 0.9) // цвет фона tabBar
        customizableViewControllers?.removeFirst() // запрет на использование первой ячейки tabBar
        
//        dispatchQueue()
        setupController()
        setupOtherViewController()
        setupOneMoreVIewController()
        setupOneMoreVIewController2()
        setupOneMoreVIewController3()
        setupOneMoreVIewController4()
    }
    
    func setupController() {
        controller.tabBarItem = UITabBarItem(title: "controller0", image: UIImage(systemName: "mic.fill"), tag: 0)
        controller.tabBarItem.badgeColor = .systemBlue // цвет бэйджа
        controller.tabBarItem.badgeValue = "345" // значение бейджа
    }
    
    func setupOtherViewController() {
        otherViewController.tabBarItem = UITabBarItem(title: "controller1", image: UIImage(systemName: "message.fill"), tag: 1)
    }
    
    func setupOneMoreVIewController() {
        oneMoreVIewController.tabBarItem = UITabBarItem(title: "controller2", image: UIImage(systemName: "video.fill"), tag: 2)
    }
    
    func setupOneMoreVIewController2() {
        oneMoreVIewController2.tabBarItem = UITabBarItem(title: "controller3", image: UIImage(systemName: "phone.fill"), tag: 3)
    }
    
    func setupOneMoreVIewController3() {
        oneMoreVIewController3.tabBarItem = UITabBarItem(title: "controller4", image: UIImage(systemName: "video.fill"), tag: 4)
    }
    
    func setupOneMoreVIewController4() {
        oneMoreVIewController4.tabBarItem = UITabBarItem(title: "controller5", image: UIImage(systemName: "envelope.fill"), tag: 5)
    }
    
//    func dispatchQueue() {
//        // отображение указанного tabbar через 2 сек после запуска приложения
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.setViewControllers([self.controller], animated: true)
//        }
//        // отображение указанного tabbar через 6 сек после запуска приложения
//        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
//            self.setViewControllers([self.controller, self.otherViewController, self.oneMoreVIewController], animated: true)
//        }
//    }
    
}
