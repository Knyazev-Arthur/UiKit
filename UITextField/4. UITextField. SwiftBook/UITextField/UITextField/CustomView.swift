import UIKit

class CustomView: UIView, UITextFieldDelegate {
    
    var actionOne: ((UIAlertController) -> Void)?
    
    // Объявление элементов экрана
    private let label = UILabel() // лэйбл
    private let textField = UITextField() // поле для текста
    private let button = UIButton() // кнопка
    
    // Основной инициализатор
    init() {
        super.init(frame: .zero)
        setupCustomView() // настройка экрана
    }
    // Обязательный инициализатор для случая, когда настройки экрана передаются, как файл storyboard или XIB
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // Настройка экрана
    private func setupCustomView() {
        backgroundColor = .green // устанавливаем цвет фона
        
        // добавление элементов на экран
        addSubview(label)
        addSubview(textField)
        addSubview(button)
        
        // размещение элементов
        setupElementsConstraints()
        
        // конфигурации элементов
        setupElements()
    }
    
    // Конфигурации элементов
    private func setupElements() {
        setupLabel()
        setupTextField()
        setupButton()
    }
    
    // Размещение элементов
    private func setupElementsConstraints() {
        setupLabelConstraints()
        setupTextFieldConstraints()
        setupButtonConstraints()
    }
    
    // конфигурации лэйбла
    private func setupLabel() {
        label.textColor = .black // цвет текста
        label.font = label.font.withSize(35) // шрифт текста
        label.numberOfLines = 0 // автоматическое увеличение строк в зависимости от текста в пределах размера
        label.sizeToFit() // автоматическая настройка размера текста в зависимоти от его объема в пределах ограничений
        label.textAlignment = .center // размещение текста по центру
        label.lineBreakMode = .byWordWrapping // перенос по словам
    }
    
    // конфигурации текстового поля
    private func setupTextField() {
        textField.placeholder = "Enter your name" // замещающий текст
//        textField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2) // прозрачность фона
        
        textField.textAlignment = .left // выравнивание текста по левому краю
        textField.textColor = .black // цвет текста
        textField.adjustsFontSizeToFitWidth = true // автоматическое изменение размера текста по ширине
        textField.font = UIFont.systemFont(ofSize: 15) // шрифт текста
        
        textField.borderStyle = .roundedRect // стиль рамки
        textField.layer.cornerRadius = 8.0 // радиус закругления углов рамки
        
        textField.autocorrectionType = .no // откл предложения и автоматического исправления грамматических ошибок
        textField.autocapitalizationType = .none // автоматическая капитализация текста отсутствует
        textField.keyboardType = .default // выход стандартной клавиатуры
        textField.textContentType = .none // нет конкретного типа контента
        textField.clearButtonMode = .always // показывать кнопку отчистки текстового поля всегда
    }
    
    // конфигурация кнопки
    private func setupButton() {
        button.backgroundColor = .systemTeal // цвет фона
        button.setTitleColor(.white, for: .normal) // цвет названия кнопки для ненажатого состояния
        button.setTitle("Done", for: .normal) // название кнопки в ненажатом состоянии
        button.contentHorizontalAlignment = .center // размещение названия кнопки по середине
        button.addTarget(self, action: #selector(clickButton), for: .allTouchEvents)
    }
    
    // размещение лэйбла
    private func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false // откл автоматическую установку ограничений
        
        // настраиваем свои ограничений
        let top = label.topAnchor.constraint(equalTo: self.topAnchor, constant: 50)
        let centerX = label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = label.widthAnchor.constraint(equalToConstant: 300)
        let height = label.heightAnchor.constraint(equalToConstant: 60)
        
        let items = [top,centerX,width,height]
        NSLayoutConstraint.activate(items) // активация органичений
    }
    
    // размещение текстового поля
   private func setupTextFieldConstraints() {
       textField.translatesAutoresizingMaskIntoConstraints = false

       let top = textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20) // отступ от низа лэйбла
       let centerX = textField.centerXAnchor.constraint(equalTo: self.centerXAnchor) // выравнивание по центру оси X экрана
       let trailing = textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20) // смещение на 20 тчк от правой границы экрана
       
       let items = [top, centerX, trailing]
       NSLayoutConstraint.activate(items) // активация органичений
   }
    
    // размещение кнопки
    private func setupButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false // откл автоматическую установку ограничений
        
        // добавляем ограничения
        let top = button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50)
        let centerX = button.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = button.widthAnchor.constraint(equalToConstant: 200)
        let height = button.heightAnchor.constraint(equalToConstant: 30)
        
        let items = [top,centerX,width,height]
        NSLayoutConstraint.activate(items) // активация органичений
    }
    
    // Логика проверки наличия цифр в тексте
    private func containsNumbers(_ text: String?) -> Bool {
        guard let text = text else { return false } // с помощью опциональной привязки проверяем можно ли извлечь текст и инициализировать его константе
        let decimalChar = CharacterSet.decimalDigits // инициализация константе множества с цифрами для использования в поисковой операции
        let bool = text.rangeOfCharacter(from: decimalChar) != nil // если в текстовом поле будет найдена цифра вернется true
        
        return bool
    }
    
    // анимации при нажатии на кнопку
    private func animateButtonPress() {
        UIView.animate(withDuration: 0.3, animations: { // устанавливаем длительность анимации в начале
            self.button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) // при нажатии кнопка уменьшается до размера в 90% с помощью матрицы преобразования
        }) { (_) in
            UIView.animate(withDuration: 0.3) { // устанавливаем длительность анимации в конце
                self.button.transform = .identity // возвращаем исходный размер кнопки
            }
        }
    }
    
    // Логика работы в зависимости от введенных в текстовое поля данных
    @objc private func clickButton(_ selector: UIButton) {
        animateButtonPress() // анимации при нажатии на кнопку
        
        guard textField.text?.isEmpty == false else { return } // если текстовое поле не будет пустым выполнется код ниже, иначе выход
        
        let text = textField.text // инициализация константе введенного в текстовое поле текста
        
        if containsNumbers(text) {
            let alert = UIAlertController(title: "Wrong format", message: "Pleace enter your name", preferredStyle: .alert) // всплывающее окно с предупреждением о неправильном формате ввода
            let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil) // действие со всплывающем сообщении для закрытия окна предупреждения
            alert.addAction(actionOK) // добавляем действие для закрытия во всплывающее окно
            textField.text = nil // очищаем содержимое текстового поля после нажатия на кнопку Done для возможности ввода новых значений
            actionOne?(alert)
        } else {
            
            label.text = textField.text // инициализация текстовому свойству лэйбла данных из текстового поля
            textField.text = nil
        }
    }
}
