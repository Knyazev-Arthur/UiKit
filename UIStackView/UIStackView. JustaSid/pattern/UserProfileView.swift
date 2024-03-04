import UIKit

// Реализация минимального функционала приложения - "Калькулятор скидок"

class UserProfileView: UIView {

    private let textField: UITextField
    private let scrollView: UIScrollView
    private let stackView: UIStackView
    private var summ: Double
    
    init() {
        self.textField = UITextField()
        self.scrollView = UIScrollView()
        self.stackView = UIStackView()
        self.summ = Double()
        
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = .green
        
        addSubview(textField)
        addSubview(scrollView)
        
        setupTextField()
        setupStackView()
        
        setupTextFieldConstraints()
        setupScrollViewConstraints()
        setupStackViewConstraints()
    }
    
    func setupTextFieldConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 30)
        let leading = textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let height = textField.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupScrollViewConstraints() {
        scrollView.addSubview(stackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = scrollView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30)
        let leading = scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let height = scrollView.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stackView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        let leading = stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
        let trailing = stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        
        NSLayoutConstraint.activate([top, leading, trailing])
    }
    
    func setupTextField() {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 15
        textField.addTarget(self, action: #selector(textFieldAction), for: .editingChanged) // метод вызываeтся при изменении текста в поле
    }
    
    func setupStackView() {
        stackView.spacing = 10 // расстояние между представлениями внутри stackView

        let persents = [0, 5, 10, 15, 20, 25] // массив с % скидок
        persents.forEach { percent in // проход по массиву и выполнение следующего кода для каждого элемента
            let button = makeButton(with: percent) // создание кнопок идля конкретного %
            stackView.addArrangedSubview(button) // добавление созданной кнопки в stackView, использующего свойство arrangedSubviews для управления представлениями внутри себя
        }
    }
    
    func makeButton(with percent: Int) -> UIButton {
        let button = UIButton()
        
        button.setTitle(" discont \(percent)% ", for: .normal) // установка текста кнопки с указанием процента скидки
        button.setTitleColor(.black, for: .normal) // установка цвета текста кнопки в обычном состоянии.
        button.setTitleColor(.gray, for: .highlighted) // установка цвета текста кнопки при нажатии
        button.tag = percent // устанавливаем тег кнопки для идентификации процента скидки
        button.backgroundColor = .lightGray // устанавливаем цвет фона кнопки
        button.layer.cornerRadius = 15 // устанавливаем радиус закругления кнопки
        button.addTarget(self, action: #selector(buttondAction), for: .touchUpInside) // обработка нажатия кнопки
        
        return button
    }
    
    @objc func textFieldAction(_ sender: UITextField) { // обработка события изменения текста в текстовом поле
        guard let text = sender.text else { return }
        summ = Double(text) ?? 0 // инициализация переменной числового представления содержания строки
    }
    
    @objc func buttondAction(_ sender: UIButton) { // обработка нажатия на кнопку
        let finishSumm = summ - summ / 100 * Double(sender.tag) // вычисление итоговой суммы со скидкой
        print(finishSumm)
        
        // stackView работает с layout самостоятельно
        UIView.animate(withDuration: 0.25) {
            sender.isHidden = true
        }
    }
    
}
