import UIKit

class TabBarController: UITabBarController {
    
    private let timeVC: TimeViewController
    private let alarmVC: AlarmViewController
    private let stopwatchVC: StopwatchViewController
    private let timerVC: TimerViewController
    
    init() {
        self.timeVC = TimeViewController()
        self.alarmVC = AlarmViewController()
        self.stopwatchVC = StopwatchViewController()
        self.timerVC = TimerViewController()
        
        super.init(nibName: nil, bundle: nil)
        setupTabBarController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TabBarController {
    
    func setupTabBarController() {
        let controllerArray = [timeVC, alarmVC, stopwatchVC, timerVC]
        setViewControllers(controllerArray, animated: true)
        tabBar.tintColor = .yellow // цвет items в выбранном состоянии
        tabBar.isTranslucent = false // отключение прозрачности tabBar
        tabBar.barTintColor = .black // цвет фона tabBar
    }
}
