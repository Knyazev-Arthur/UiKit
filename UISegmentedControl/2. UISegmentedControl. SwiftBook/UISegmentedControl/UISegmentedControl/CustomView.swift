import UIKit

class CustomView: UIView {
    
    // основной инициализатор
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    // инициализатор для случая, когда представление передается как файл Storyboard, XIB
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // ОБЪЯВЛЕНИЕ ЭЛЕМЕНТОВ
    private let segmentedControl = UISegmentedControl(items: ["First","Second","Third"]) // инициализация заголовками
    private let label = UILabel()
    
    // НАСТРОЙКА ЭКРАНА
    private func setupUI() {
        // установка фонового цвета
        backgroundColor = .green
        
        // добавление элементов на экран
        addSubview(segmentedControl)
        addSubview(label)
        
        // конфигурация элементов
        setupElements()
        
        // размещение элементов на экране
        setupElementsConstraints()
    }
    
    // КОНФИГУРАЦИЯ ЭЛЕМЕНТОВ
    private func setupElements() {
        setupSegmentedControl()
        setupLabel()
    }
    
    // РАЗМЕЩЕНИЕ ЭЛЕМЕНТОВ
    private func setupElementsConstraints() {
        setupSegmentedControlConstraints()
        setupLabelConstraints()
    }
    
    // конфигурации segmentedControl
    private func setupSegmentedControl() {
        segmentedControl.addTarget(self, action: #selector(segmentSelection), for: .valueChanged)
    }
    
    // конфигурации лэйбла
    private func setupLabel() {
        label.textAlignment = .center // размещение текста внутри лэйбла по центру
        label.isHidden = true // отключаем видимость лэйбла
        label.font = label.font.withSize(35) // устанавливаем размер текста лэйбла
        label.numberOfLines = 0 // устанавливаем самостоятельный расчет кол-ва линий
        label.lineBreakMode = .byWordWrapping // делаем перенос текста по словам
    }
    
    // размещение segmentedControl
    private func setupSegmentedControlConstraints() {
        // откл автоматическую установку ограничений
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        let top = segmentedControl.topAnchor.constraint(equalTo: self.topAnchor, constant: 50)
        let centerX = segmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = segmentedControl.widthAnchor.constraint(equalToConstant: 300)
        let height = segmentedControl.heightAnchor.constraint(equalToConstant: 40)

        // активация констрейнтов
        let constraints = [top, centerX, width, height]
        NSLayoutConstraint.activate(constraints)
    }
    
    // размещение лэйбла
    private func setupLabelConstraints() {
        // откл автоматическую установку ограничений
        label.translatesAutoresizingMaskIntoConstraints = false

        let top = label.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 30)
        let centerX = label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = label.widthAnchor.constraint(equalToConstant: 300)
        let height = label.heightAnchor.constraint(equalToConstant: 100)

        // активация констрейнтов
        let constraints = [top, centerX, width, height]
        NSLayoutConstraint.activate(constraints)
    }
    
    // метод для обработки отображения элементов в зависимости от установки сегмента
    @objc private func segmentSelection(_ sender: UISegmentedControl) {
        
        // вкл отображение лэйбла
        label.isHidden = false
        
        switch sender.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is selected"
            label.textColor = .red
        case 1:
            label.text = "The second segment is selected"
            label.textColor = .blue
        case 2:
            label.text = "The third segment is selected"
            label.textColor = .yellow
        default: break
        }
    }
}
