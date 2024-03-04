import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создание экземпляра класса CustomView
        let customView = CustomView(frame: view.bounds) // свойство bounds - прямоугольник, определяющий размер представления относительно его собственной системы координат
        
        // добавление кастомного экрана на экран view
        view.addSubview(customView)
        
        // настройка размещения кастомного экрана на экране view
        // откл автоматический расчет ограничений
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        // установка ограничений для кастомного экрана
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor), // ограничение левого края
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor), // ограничение правого края
            customView.topAnchor.constraint(equalTo: view.topAnchor), // ограничение по верхнему краю
            customView.bottomAnchor.constraint(equalTo: view.bottomAnchor) // ограничение по нижнему краю
        ])
    }
}
