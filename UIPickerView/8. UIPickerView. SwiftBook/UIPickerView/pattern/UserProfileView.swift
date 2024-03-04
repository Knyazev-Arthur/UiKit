import UIKit

class UserProfileView: UIView {
    
    let textField = UITextField()

    private let labelOne = UILabel()
    private let labelTwo = UILabel()
    private let pickerView = UIPickerView()
    private let toolBar = UIToolbar()
    private var barButton = UIBarButtonItem()
    
    init() {
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func delegatePickerView(delegate: UIPickerViewDelegate, dataSourse: UIPickerViewDataSource) {
        pickerView.delegate = delegate
        pickerView.dataSource = dataSourse
    }
    
    func hideAllElement() {
        labelOne.isHidden = true
        labelTwo.isHidden = true
    }
    
    func hideLabelOne() {
        labelOne.isHidden = false
    }
    
    func hideLabelTwo() {
        labelTwo.isHidden = false
    }
    
    private func setupUserProfileView() {
        backgroundColor = .orange
        addSubviewElements()
        setupElementsConstrains()
        setupElements()
    }
    
    private func addSubviewElements() {
        addSubview(labelOne)
        addSubview(labelTwo)
        addSubview(textField)
    }
    
    private func setupElementsConstrains() {
        setupLabelOneConstraints()
        setupLabelTwoConstraints()
        setupTextFieldConstraints()
    }
    
    private func setupElements() {
        setupLabelOne()
        setupLabelTwo()
        setupTextField()
        setupToolBar()
    }
    
    private func setupLabelOneConstraints() {
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        
        let top = labelOne.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        let centerX = labelOne.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let height = labelOne.heightAnchor.constraint(equalToConstant: 100)
        let width = labelOne.widthAnchor.constraint(equalTo: self.widthAnchor)
        
        NSLayoutConstraint.activate([top,height,width,centerX])
    }
    
    private func setupLabelTwoConstraints() {
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        
        let top = labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor)
        let centerX = labelTwo.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let height = labelTwo.heightAnchor.constraint(equalToConstant: 100)
        let width = labelTwo.widthAnchor.constraint(equalTo: self.widthAnchor)
        
        NSLayoutConstraint.activate([top,height,width,centerX])
    }
    
    private func setupTextFieldConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = textField.topAnchor.constraint(equalTo: labelTwo.bottomAnchor, constant: 30)
        let trailing = textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        let centerX = textField.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        
        NSLayoutConstraint.activate([top,centerX,trailing])
    }
    
    private func setupLabelOne() {
        labelOne.text = "Привет! Я первый лэйбл для проверки."
        labelOne.layer.borderColor = UIColor.black.cgColor
        labelOne.layer.borderWidth = 2
        labelOne.backgroundColor = .white
        labelOne.textAlignment = .center
    }
    
    private func setupLabelTwo() {
        labelTwo.text = "Привет! А я второй лэйбл для проверки."
        labelTwo.layer.borderColor = UIColor.black.cgColor
        labelTwo.layer.borderWidth = 2
        labelTwo.backgroundColor = .white
        labelTwo.textAlignment = .center
    }
    
    private func setupTextField() {
        textField.placeholder = "Выбери элемент для скрытия"
        textField.borderStyle = .roundedRect
        textField.inputView = pickerView
        textField.inputAccessoryView = toolBar
    }
    
    private func setupToolBar() {
        barButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolBar.sizeToFit() // размещаем по размеру экрана
        toolBar.setItems([barButton], animated: true) // размещаем на toolBar массив объектов
        toolBar.isUserInteractionEnabled = true // позволяем взаимодействовать пользователю с элементом
        toolBar.tintColor = .white // цвет текста
        toolBar.barTintColor = .brown // цвет заливки 
    }
    
    // метод для закрытия клавиатуры
    @objc private func dismissKeyboard() {
        self.endEditing(true)
    }
}
