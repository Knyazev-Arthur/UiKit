import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trueButton.layer.borderColor = UIColor.red.cgColor // установили цвет границы кнопки
        trueButton.layer.borderWidth = 1 // установили толщину границы кнопки
        trueButton.layer.cornerRadius = 10 // установили радиус закругления углов кнопки
        
        // объявим новую кнопку
        let actionButton = UIButton() // присваиваем переменной нвоую кнопку типа UIButton
        view.addSubview(actionButton) // с помощью метода addSubview добавляем кнопку в иерархию представления экрана

        actionButton.layer.borderColor = UIColor.red.cgColor
        actionButton.layer.borderWidth = 1
        actionButton.layer.cornerRadius = 10
        
        
        // создадим и настроим constrains с помощью кода
        actionButton.translatesAutoresizingMaskIntoConstraints = false // отключаеv автоматически создаваемые констрейнты (ограничения) для кнопки
        NSLayoutConstraint.activate([ // активируем массив констрейнтов (ограничений) для кнопки
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16), // отступ от правого края view на 16 тчк.
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -93), // отступ от нижнего края view
            actionButton.widthAnchor.constraint(equalToConstant: 145), // ширина кнопки
            actionButton.heightAnchor.constraint(equalToConstant: 109)]) // высота кнопки
        
        actionButton.setTitle("Действие", for: .normal) // текстовый заголовок кнопки в состоянии .normal (ненажатом)
        actionButton.setTitleColor(.red, for: .normal) // красный цвет текста кнопки для ненажатого состояния
        actionButton.setTitleColor(.orange, for: .highlighted) // цвет текста кнопки для нажатого состояния
        actionButton.showsTouchWhenHighlighted = true // подсветка кнопки при нажатии
        
        // с помощью метода addTarget устанавливаем  метод letAction() как действие, которое будет выполняться при нажатии на кнопку (touchUpInside).
        actionButton.addTarget(self, action: #selector(letAction), for: .touchUpInside)
    }

    @IBAction func trueAction(_ sender: Any) {
        titileLabel.text = Source.getInfo(type: .word)
    }
    
   @objc func letAction() {
        titileLabel.text = Source.getInfo(type: .action)
    }
}
