import UIKit

class ViewController: UIViewController {
    
    // объявляем связь с элементами storyboard для взаимодействия с ними
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    let mySwitch = UISwitch() // объявляем экземпляр класса UISwitch
    
    override func viewDidLoad() { // перопределяем метод, вызываемый после запуска приложения
        super.viewDidLoad() // вызываем родительский метод
        
        segmentedControl.alpha = 0 // устанавливаем прозрачность элемента segmentedControl для скрытия его изначально
        sendButton.alpha = 0 // устанавливаем прозрачность элемента sendButton для скрытия его изначально
        
        view.addSubview(mySwitch) // добавляем переключать switch на главный экран
        mySwitch.translatesAutoresizingMaskIntoConstraints = false // отключаем автоматический расчет констрайнтов
        NSLayoutConstraint.activate([ // самостоятельно добавляем констрайнты
            mySwitch.topAnchor.constraint(equalTo: label.topAnchor), // устанавливаем верхний край (topAnchor) mySwitch на том же уровне, что и верхний край label (label.topAnchor) с помощью метода constraint
            mySwitch.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8)]) // устанавливаем левый край (leadingAnchor) mySwitch на расстоянии 8 точек от правого края label (label.trailingAnchor)
        
        // устанавливаем обработчик switchAction для события изменения значения переключателя (valueChanged - при изменении значения переключателя)
        mySwitch.addTarget(self, action: #selector(switchAction(sender:)), for: .valueChanged)
    }
    
    // объявляем метод, принимающей значение типа UISwitch
    @objc func switchAction(sender: UISwitch) {
        if sender.isOn { // условия - если switch включен
            UIView.animate(withDuration: 0.5) { // анимация будет срабатывать через 0.5 сек после нажатия
                self.segmentedControl.alpha = 1 // делаем видимым табло с сегментами
                self.sendButton.alpha = 1 // делаем видимым кнопку отзыва
            }
        } else { // условия - если switch выключен
                UIView.animate(withDuration: 0.5) {
                self.segmentedControl.alpha = 0 // делаем невидимым табло с сегментами
                self.sendButton.alpha = 0 // делаем невидимой кнопку отзыва
            }
        }
    }
    // метод для вывода в консоль благодарности при выставлении оценки
    @IBAction func sendAction() {
        print("Спасибо за Ваш отзыв - \(segmentedControl.selectedSegmentIndex + 1)")
    }
}
