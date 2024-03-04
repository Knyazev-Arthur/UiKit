import UIKit

class ViewController: UIViewController {
    
    // объявляем экземпляр класса UILabel
    var label: UILabel!
    // объявляем экземпляр класса UISlider
    var mySlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // объявляем экземпляр класса UISlider - слайдер
        mySlider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 0)) // указываем координаты и размеры слайда. Координаты 0, поскольку они будут установлены позже с помощью иного метода. Высота 0, поскольку слайдер имеет свою высоту.
        view.addSubview(mySlider) // добавляем слайдер на главное представление
        mySlider.center = view.center // ставим слайдер посередине приравнивая его середину к середине главного представления
        
        mySlider.minimumValue = 0
        mySlider.maximumValue = 100
        mySlider.addTarget(self, action: #selector(sliderAction(sender:)), for: .valueChanged)
        mySlider.isContinuous = false // слайдер будет передавать своё значение только после того, как пользователь закончит перемещение ползунка. В случае true - значения будут передаваться непрерывно во время перемещения ползунка.
        
        mySlider.minimumTrackTintColor = .red // устанавливаем цвет для левой части ползунка
        mySlider.maximumTrackTintColor = .green // устанавливаем цвет для правой части ползунка
        mySlider.thumbTintColor = .systemPink // устанавливаем цвет для ползунка
        
        mySlider.value = 50 // при запуске приложения слайдер будет установлен на отметке 50
        
        label = UILabel(frame: CGRect(x: 0, y: 250, width: 300, height: 100)) // задаем координаты и размеры label
        view.addSubview(label) // добавляем label на главное представление
        label.text = "some text"
        label.center.x = view.center.x // размещаем label в центре по оси x
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        sleep(1) // задержка на 1 секунду
        mySlider.setValue(75, animated: true) // при выполнении этой команды ползунок слайдера будет плавно перемещаться к значению 75 с анимацией
    }
    
    // объявляем метод, который будет вызываться при движении слайдера
    @objc func sliderAction(sender: UISlider) {
        label.text = "\(sender.value )" // в теле метода происходит установка значения свойства text label в зависимости от расположения ползунка
    }
}
