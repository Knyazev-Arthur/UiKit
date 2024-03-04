import UIKit

@UIApplicationMain // атрибут указывает компилятору, что класс является главным делегатом приложения и содержит точку старта.

class AppDelegate: UIResponder, UIApplicationDelegate { // определение класса AppDelegate, используещегося для обработки жизненного цикла приложения, являющегося делегатом приложения и реализующего протокол UIApplicationDelegate, определяющего методы управления состоянием приложения
    
    var window: UIWindow? // переменная, которая будет содержать основное окно приложения
    
    // метод делегата, вызывающегося при запуске приложения. Возвращает true, если запуск приложения выполнен успешно
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow() // инициализируем новое окно
        
        let controller = ViewController()
//        let navigationController = UINavigationController(rootViewController: controller) // установка controller в качестве корневого контроллера
        let navigationController = UINavigationController()
        navigationController.viewControllers.append(controller) // инициализация стека (массива) контроллеров navigationController первым контроллером, который автоматически становится rootViewController
//        navigationController.setNavigationBarHidden(true, animated: false) // скрытие автоматической навигационной панели navigationController
        
        window?.rootViewController = navigationController // назначаем главный контроллер приложения
        window?.makeKeyAndVisible() // устанавливаем окно, как основное и отображаемое
        return true
    }
}
