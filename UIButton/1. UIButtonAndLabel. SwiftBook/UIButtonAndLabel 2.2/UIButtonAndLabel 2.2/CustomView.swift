import UIKit

class CustomView: UIView {
    
    // основной инициализатор
    init() {
        super.init(frame: .zero) // zero - свойство, представляющее прямоугольник типа CGRect с нулевой шириной и высотой
        setupUI()
    }
    
    // инициализатор для случая, когда представление передается как файл Storyboard, XIB
    required init?(coder: NSCoder) { // required означает, что каждый подкласс должен реализовать данный инициализатор
        super.init(coder: coder)
        // почему Данила убрал setupUI() ?
    }
    
    // объявление лэйбла
    private let label = UILabel()
    // объявление кнопок
    private let buttonOne = UIButton()
    private let buttonTwo = UIButton()
    private let buttonThree = UIButton()
    
    // метод настройки экрана
    private func setupUI() {
        
        // добавление элементов на экран
        addSubview(label)
        addSubview(buttonOne)
        addSubview(buttonTwo)
        addSubview(buttonThree)
        
        // вызов методов с конфигурациями элементов
        setupLabel()
        setupButtonOne()
        setupButtonTwo()
        setupButtonThree()
        
        // вызов метода с установкой ограничений элементов
        setupConstraints()
    }
    
    // метод установки ограничений
    private func setupConstraints() {
        setupLabelContaints()
        setupButtonOneConstraints()
        setupButtonTwoConstraints()
        setupButtonThreeConstraints()
    }
    
    // РАЗМЕЩЕНИЕ ЭЛЕМЕНТОВ
    // метод для размещения лэйбла
    private func setupLabelContaints() {
        // отключаем автоматическую установку ограничений лэйбла
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // установка ограничений размещения лэйбла
        let top = label.topAnchor.constraint(equalTo: self.topAnchor, constant: 50)
        let centerX = label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = label.widthAnchor.constraint(equalToConstant: 300)
        let height = label.heightAnchor.constraint(equalToConstant: 35)
        
        // активация констрейнтов
        let constraints = [top, centerX, width, height]
        NSLayoutConstraint.activate(constraints)
    }
    
    // метод для размещения кнопки Action 1
    private func setupButtonOneConstraints() {
        // отключаем автоматическую установку ограничений
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        
        // установка ограничений размещения
        let top = buttonOne.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 250)
        let centerX = buttonOne.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = buttonOne.widthAnchor.constraint(equalToConstant: 145)
        let height = buttonOne.heightAnchor.constraint(equalToConstant: 30)
        
        // активация констрейнтов
        let constraints = [top, centerX, width, height]
        NSLayoutConstraint.activate(constraints)
    }
    
    // метод для размещения кнопки Action 2
    private func setupButtonTwoConstraints() {
        // отключаем автоматическую установку ограничений
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        
        // установка ограничений размещения
        let top = buttonTwo.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 16)
        let centerX = buttonTwo.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = buttonTwo.widthAnchor.constraint(equalToConstant: 145)
        let height = buttonTwo.heightAnchor.constraint(equalToConstant: 30)
        
        // активация констрейнтов
        let constraints = [top, centerX, width, height]
        NSLayoutConstraint.activate(constraints)
    }
    
    // метод для размещения кнопки Clear
    private func setupButtonThreeConstraints() {
        // отключаем автоматическую установку ограничений
        buttonThree.translatesAutoresizingMaskIntoConstraints = false
        
        // установка ограничений размещения
        let top = buttonThree.topAnchor.constraint(equalTo: buttonTwo.bottomAnchor, constant: 16)
        let centerX = buttonThree.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = buttonThree.widthAnchor.constraint(equalToConstant: 145)
        let height = buttonThree.heightAnchor.constraint(equalToConstant: 30)
    
        // активация констрейнтов
        let constraints = [top, centerX, width, height]
        NSLayoutConstraint.activate(constraints)
    }
    
    // КОНФИГУРАЦИЯ ЭЛЕМЕНТОВ
    // метод с конфигурациями лэйбла
    private func setupLabel() {
        label.textAlignment = .center // размещаем текст внутри метки по центру
        label.textColor = .black // устанавливаем цвет текста метки
        label.font = label.font.withSize(35) // устанавливаем размер текста метки
        label.isHidden = true // выкл видимость
    }
    
    // метод с конфигурациями кнопки Action 1
    private func setupButtonOne() {
        buttonOne.setTitle("Action 1", for: .normal) // устанавливаем название кнопки
        buttonOne.tag = 0 // устанавливаем тэг кнопки для более удобного выполнения условий с ней
        buttonOne.backgroundColor = .black // устанавливаем цвет заливки
        buttonOne.setTitleColor(.white, for: .normal) // устанавливаем цвет названия кнопки
        buttonOne.titleLabel?.textAlignment = .center // размещаем название кнопки по центру
        buttonOne.addTarget(self, action: #selector(pressButton), for: .touchUpInside) // установка действия нажатия
    }
    
    // метод с конфигурациями кнопки Action 2
    private func setupButtonTwo() {
        buttonTwo.setTitle("Action 2", for: .normal) // устанавливаем название кнопки
        buttonTwo.tag = 1 // устанавливаем тэг кнопки для более удобного выполнения условий с ней
        buttonTwo.backgroundColor = .black // устанавливаем цвет заливки
        buttonTwo.setTitleColor(.white, for: .normal) // устанавливаем цвет названия кнопки
        buttonTwo.titleLabel?.textAlignment = .center // размещаем название кнопки по центру
        buttonTwo.addTarget(self, action: #selector(pressButton), for: .touchUpInside) // установка действия нажатия
    }
    // метод с конфигурациями кнопки Clear
    private func setupButtonThree() {
        buttonThree.setTitle("Clear", for: .normal) // устанавливаем название кнопки
        buttonThree.tag = 2 // устанавливаем тэг кнопки для более удобного выполнения условий с ней
        buttonThree.backgroundColor = .black // устанавливаем цвет заливки
        buttonThree.setTitleColor(.white, for: .normal) // устанавливаем цвет названия кнопки
        buttonThree.titleLabel?.textAlignment = .center // размещаем название кнопки по центру
        buttonThree.isHidden = true // выкл видимость
        buttonThree.addTarget(self, action: #selector(pressButton), for: .touchUpInside) // установка действия при нажатии
    }
    
    // метод для обработки отображения элементов в зависимости от нажатия кнопки
    @objc private func pressButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            label.text = "Hello, World!"
            label.isHidden = false // вкл отображение метки
            buttonThree.isHidden = false // вкл отображение кнопки3
        case 1:
            label.text = "Hi there!"
            label.isHidden = false // вкл отображение метки
            buttonThree.isHidden = false // вкл отображение кнопки3
        case 2:
            label.isHidden = true // выкл отображение метки
            buttonThree.isHidden = true // выкл отображение кнопки3
        default: break
        }
    }
}
