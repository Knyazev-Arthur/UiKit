import UIKit

class CustomView: UIView {
    
    // основной инициализатор
    init() {
        super.init(frame: .zero)
        setupCustomView()
    }
    // проваливающийся инициализатор для случая, когда представление передается, как файл storyBoard, XIB
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCustomView() // настройка экрана
    }
    
    // Объявление элементов
    private let slider = UISlider()
    private let label = UILabel()
    
    // Настройка экрана
    private func setupCustomView() {
        
        backgroundColor = .green // меняем цвет фона
        
        addSubview(slider) // добавляем слайдер на экран
        addSubview(label) // добавляем лэйбл на экран
        
        setupElements() // конфигурация элементов экрана
        setupElementsConstraints() // расположение элементов экрана
    }
    
    // Конфигурация элементов
    private func setupElements() {
        setupSlider()
        setupLabel()
    }
    
    // Размещение элементов
    private func setupElementsConstraints() {
        setupSliderConstraints()
        setupLabelConstraints()
    }
    
    // конфигурации слайдера
    private func setupSlider() {
        slider.minimumValue = 0 // задаем минимальное значение
        slider.maximumValue = 1 // задаем максимальное значение
        slider.minimumTrackTintColor = .yellow // устанавливаем цвет левой части слайдера
        slider.maximumTrackTintColor = . red // устанавливаем цвет правой части слайдера
        slider.thumbTintColor = .blue // устанавливаем цвет ползунка
        slider.addTarget(self, action: #selector(sliderMovement), for: .allTouchEvents)
    }
    
    // конфигурации лэйбла
    private func setupLabel() {
        label.text = String(slider.value) // текст лэйбла отображает текущее значение слайдера
        label.font = label.font.withSize(35) // устанавливаем размер текста
        label.textAlignment = .center // размещение текста по центру
        label.numberOfLines = 0 // лэйбл будет автоматически увеличивать строки в пределах своих ограничений в зависимости текста
        label.lineBreakMode = .byWordWrapping // перенос текста по словам
        label.sizeToFit() // автоматическая установка размера текста
    }
    
    // размещение лэйбла
    private func setupLabelConstraints() {

        label.translatesAutoresizingMaskIntoConstraints = false // откл автоматическую установку ограничений
        
        // настройка ограничений
        let top = label.topAnchor.constraint(equalTo: self.topAnchor, constant: 50) // ограничения по верхнему краю
        let centerX = label.centerXAnchor.constraint(equalTo: self.centerXAnchor) // установка лэйбла по центру оси Х
        let width = label.widthAnchor.constraint(equalToConstant: 300) // ширина лэйбла
        let height = label.heightAnchor.constraint(equalToConstant: 50) // высота лэйбла
        
        let constrains = [top,centerX,width,height]
        NSLayoutConstraint.activate(constrains) // активация ограничений
    }
    
    // размещение слайдера
    private func setupSliderConstraints() {
        
        slider.translatesAutoresizingMaskIntoConstraints = false // откл автоматическую установку ограничений
        
        // настройка ограничений
        let top = slider.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30) // ограничения по верхнему краю
        let centerX = slider.centerXAnchor.constraint(equalTo: self.centerXAnchor) // установка лэйбла по центру оси Х
        let width = slider.widthAnchor.constraint(equalToConstant: 300) // ширина лэйбла
        let height = slider.heightAnchor.constraint(equalToConstant: 50) // высота лэйбла
               
        let constrains = [top,centerX,width,height]
        NSLayoutConstraint.activate(constrains) // активация ограничений
    }
    
    @objc private func sliderMovement(_ sender: UISlider) {
        label.text = String(sender.value)
        let backgrandColor = self.backgroundColor // константе присваивается текущее значение фона
        self.backgroundColor = backgrandColor?.withAlphaComponent(CGFloat(sender.value)) // устанавливаем прозрачность
    }
}
