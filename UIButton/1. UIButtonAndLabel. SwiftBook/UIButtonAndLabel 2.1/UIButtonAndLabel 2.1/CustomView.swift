import UIKit

class CustomView: UIView {
    
    // инициализатор для установки размера экрана
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    // инициализатор для случая, когда представление передается как файл Storyboard, XIB
    required init?(coder: NSCoder) { // required означает, что каждый подкласс должен реализовать данный инициализатор
        super.init(coder: coder)
        setupUI()
    }
    
    // объявление метки
    private let label = UILabel()
    // объявление кнопок
    private let button1 = UIButton()
    private let button2 = UIButton()
    private let button3 = UIButton()
    
    private func setupUI() {
        // конфигурации метки
        label.textAlignment = .center // размещаем текст внутри метки по центру
        label.translatesAutoresizingMaskIntoConstraints = false // отключаем автоматическое создание констрэйнтов
        label.textColor = .black // устанавливаем цвет текста метки
        label.font = label.font.withSize(35) // устанавливаем размер текста метки
        
        // конфигурации 1-ой кнопки
        button1.setTitle("Action 1", for: .normal) // устанавливаем название кнопки
        button1.tag = 0 // устанавливаем тэг кнопки для более удобного выполнения условий с ней
        button1.backgroundColor = .black // устанавливаем цвет заливки
        button1.setTitleColor(.white, for: .normal) // устанавливаем цвет названия кнопки
        button1.titleLabel?.textAlignment = .center // размещаем название кнопки по центру
        
        // конфигурации 2-ой кнопки
        button2.setTitle("Action 2", for: .normal) // устанавливаем название кнопки
        button2.tag = 1 // устанавливаем тэг кнопки для более удобного выполнения условий с ней
        button2.backgroundColor = .black // устанавливаем цвет заливки
        button2.setTitleColor(.white, for: .normal) // устанавливаем цвет названия кнопки
        button2.titleLabel?.textAlignment = .center // размещаем название кнопки по центру
        
        // конфигурации 3-ей кнопки
        button3.setTitle("Clear", for: .normal) // устанавливаем название кнопки
        button3.tag = 2 // устанавливаем тэг кнопки для более удобного выполнения условий с ней
        button3.backgroundColor = .black // устанавливаем цвет заливки
        button3.setTitleColor(.white, for: .normal) // устанавливаем цвет названия кнопки
        button3.titleLabel?.textAlignment = .center // размещаем название кнопки по центру
        
        // добавление элементов (кнопки и метка) на экран
        addSubview(label)
        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
        
        // выкл отображаемость некоторых элементов при запуске
        label.isHidden = true
        button3.isHidden = true
        
        // настройка размещения элементов на экране
        // отключаем автоматическую установку ограничений
        label.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // установка ограничений для размещения метки
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 170), // отступ от верхнего края экрана
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 35),
            
            // установка ограничений для размещения кнопки 1
            button1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 250),
            button1.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button1.widthAnchor.constraint(equalToConstant: 145),
            button1.heightAnchor.constraint(equalToConstant: 30),
            
            // установка ограничений для размещения кнопки 2
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 16),
            button2.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button2.widthAnchor.constraint(equalToConstant: 145),
            button2.heightAnchor.constraint(equalToConstant: 30),
            
            // установка ограничений для размещения кнопки 2
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 16),
            button3.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button3.widthAnchor.constraint(equalToConstant: 145),
            button3.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // обработка кнопок
        button1.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        button2.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        button3.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
    }
    
    // метод для обработки отображения элементов в зависимости от нажатия кнопки
    @objc func pressButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            label.text = "Hello, World!"
            label.isHidden = false // вкл отображение метки
            button3.isHidden = false // вкл отображение кнопки3
        case 1:
            label.text = "Hi there!"
            label.isHidden = false // вкл отображение метки
            button3.isHidden = false // вкл отображение кнопки3
        case 2:
            label.isHidden = true // выкл отображение метки
            button3.isHidden = true // выкл отображение кнопки3
        default: break
        }
    }
}
