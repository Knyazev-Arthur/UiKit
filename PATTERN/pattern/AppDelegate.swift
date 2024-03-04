import UIKit

@UIApplicationMain // атрибут указывает компилятору, что класс является главным делегатом приложения и содержит точку входа - здесь запускается цикл обработки событий приложения

class AppDelegate: UIResponder, UIApplicationDelegate { // определение класса AppDelegate, используещегося для обработки жизненного цикла приложения, являющегося делегатом приложения и реализующего протокол UIApplicationDelegate, определяющего методы управления состоянием приложения
    
    var window: UIWindow? // переменная, которая будет содержать основное окно приложения
    
    // метод AppDelegate, вызывающийся при запуске приложения. Возвращает true, если запуск приложения выполнен успешно
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds) // инициализируем новое окно
        window?.rootViewController = ViewController() // назначаем главный контроллер приложения
        window?.makeKeyAndVisible() // устанавливаем окно, как основное и отображаемое
        return true
    }
}
