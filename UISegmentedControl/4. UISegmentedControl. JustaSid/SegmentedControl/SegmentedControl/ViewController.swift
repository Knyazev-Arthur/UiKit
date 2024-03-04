import UIKit

// определение класса, являющегося наследником свойств класса UIViewController. Отвечает за управление отображением пользовательского интерфейса и его взаимодействием с приложением.
class ViewController: UIViewController {
    
    // объявляем переменную типа UISegmentedControl для использования соответствующих свойств. Тип optional, посокольку в начале приложения она может быть пустой (nil), но предполагается, что после переопредления viewDidLoad() у нее будет значение
    var segmentedControl: UISegmentedControl!
    // Переопределение метода жизненного цикла контроллера, который вызывается один раз после загрузки представления контроллера в память, но перед тем, как оно будет показано пользователю. Выполняет начальные настройки интерфейса, например, установка начальных значений для элементов управления, настройка их внешнего вида или загрузка данных.
    override func viewDidLoad() {
        // вызов метода родительского класса для запуска базовой логики перед выполнением собственных настроек
        super.viewDidLoad()
        
        let titles = ["one","two","three"] // объявляем массив с названием сегментов segmentedControl
        segmentedControl = .init(items: titles) // инициализация segmentedControl сегментами
        
        segmentedControl.insertSegment(withTitle: "four", at: 3, animated: true) // добавление сегмента в segmentedControl с помощью метода insertSegment
        segmentedControl.setTitle("oone", forSegmentAt: 0) // изменяем название сегмента с индексом 0
        print(segmentedControl.titleForSegment(at: 0)!)
        segmentedControl.setImage(UIImage(systemName: "circle")!, forSegmentAt: 0) // установка изображения вместо текстового значения в 1 сегмент
        
        segmentedControl.selectedSegmentIndex = 0 // установка выбранного по умолчанию сгмента по его индексу
        segmentedControl.selectedSegmentTintColor = .red // установка цвета сегментов
        
        //segmentedControl.setWidth(150, forSegmentAt: 2) // изменение ширины сегмента по его индексу
        segmentedControl.setTitle("so long title text", forSegmentAt: 2) // изменение название сегмента по его индексу
        segmentedControl.apportionsSegmentWidthsByContent = true // включаем установку ширину сегмента по размеру текста
        print(segmentedControl.numberOfSegments) // выводим в консоль кол-во сегментов
        
        segmentedControl.addTarget(self, action: #selector(segmentAction), for: .valueChanged)
        
        
        view.addSubview(segmentedControl) // добавление segmentedControl на главное представление (экран - view) контроллера
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false // отключаем автоматический расчет/создание констрэйнтов
        
        // устанавливаем констрайт внутри главного представления
        NSLayoutConstraint.activate([
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16), // ограничение для правого края segmentedControl, устанавливая его равным правому краю главного представления (view) с отступом в 16 пунктов от края.
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), // левый край
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16) // отступ от верхней безопасной области (бар - safeAreaLayoutGuide)
        ])
    }
    @objc func segmentAction(sender: UISegmentedControl) {
        print(sender.titleForSegment(at: sender.selectedSegmentIndex)!)
    }
}
