import UIKit

@UIApplicationMain // атрибут указывает компилятору, что класс является главным делегатом приложения и содержит точку старта.

// UIResponder является базовым классом для объектов, обрабатывающих события в iOS
class AppDelegate: UIResponder, UIApplicationDelegate { // AppDelegate используется как делегат для обработки жизненного цикла приложения, реализующего протокол UIApplicationDelegate, определяющего методы управления состоянием приложения
    
    var window: UIWindow? // переменная, которая будет содержать основное окно приложения
    
    // метод делегата, вызывающегося при запуске приложения и вовращающего true при успешном запуске приложения
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow() // инициализируем новое окно
        let controller = LoginViewController() // инициализируем объект ViewController, который будет представлен, как корневой контроллер
        let navigationController = UINavigationController() // navigationController обеспечивает навигацию между экранами (view controllers) в приложении. По сути он представляет из себя массив контроллеров
        navigationController.viewControllers.append(controller) // инициализация стека (массива) контроллеров navigationController первым контроллером, который автоматически становится корневым контроллером (rootViewController)
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default) // делаем навигационную панель прозрачной
        navigationController.navigationBar.shadowImage = UIImage() // скрытие линии навигационной панели
        
        window?.rootViewController = navigationController // назначаем главный контроллер приложения
        window?.makeKeyAndVisible() // устанавливаем окно, как основное и отображаемое
        return true
    }
}
