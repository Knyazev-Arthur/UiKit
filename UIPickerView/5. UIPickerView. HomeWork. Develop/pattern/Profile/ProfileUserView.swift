import UIKit

// MARK: ProfileUserViewProtocol
protocol ProfileUserViewProtocol: UIView {
    var delegate: ProfileViewControllerProtocol? { get set }
    var pickerViewDataSource: PickerViewDataSourceProtocol { set get }
    var pickerViewDelegate: PickerViewDelegateProtocol { set get }

    var pickerViewAge: UIPickerView { set get }
    var ageData: [Int] { get set }

    var pickerViewSex: UIPickerView { set get }
    var sexData: [String] { get set }
    
    func setupTextFieldAgeText(_ text: String)
}

class ProfileUserView: UIView, ProfileUserViewProtocol {
    
    weak var delegate: ProfileViewControllerProtocol?
    var pickerViewDelegate: PickerViewDelegateProtocol
    var pickerViewDataSource: PickerViewDataSourceProtocol
    
    var pickerViewAge: UIPickerView
    var ageData = Array(1...130)
    var pickerViewSex: UIPickerView
    var sexData = ["Man", "Woman", "Ara"]
    
    private let toolbarAge: UIToolbar
    private let toolbarSex: UIToolbar
    private let personFoto: UIImageView
    private let personButton: UIButton

    private let labelName: UILabel
    private let textFieldName: UITextField
    private let stackViewName: UIStackView
    
    private let labelBirthday: UILabel
    private let textFieldBirthday: UITextField
    private let stackViewBirthday: UIStackView
    
    private let labelAge: UILabel
    private let textFieldAge: UITextField
    private let stackViewAge: UIStackView
    
    private let labelSex: UILabel
    private let textFieldSex: UITextField
    private let stackViewSex: UIStackView
    
    private let labelInsta: UILabel
    private let textFieldInsta: UITextField
    private let stackViewInsta: UIStackView
    
    init() {
        self.pickerViewDataSource = PickerViewDataSource()
        self.pickerViewDelegate = PickerViewDelegate()
        
        self.personFoto = UIImageView()
        self.personButton = UIButton()
        self.pickerViewAge = UIPickerView()
        self.toolbarAge = UIToolbar()
        self.pickerViewSex = UIPickerView()
        self.toolbarSex = UIToolbar()
        
        self.labelName = UILabel()
        self.textFieldName = UITextField()
        self.stackViewName = UIStackView()
        
        self.labelBirthday = UILabel()
        self.textFieldBirthday = UITextField()
        self.stackViewBirthday = UIStackView()
        
        self.labelAge = UILabel()
        self.textFieldAge = UITextField()
        self.stackViewAge = UIStackView()
        
        self.labelSex = UILabel()
        self.textFieldSex = UITextField()
        self.stackViewSex = UIStackView()
        
        self.labelInsta = UILabel()
        self.textFieldInsta = UITextField()
        self.stackViewInsta = UIStackView()
                
        super.init(frame: .zero)
        setupUserView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextFieldAgeText(_ text: String) {
        textFieldAge.text = text
    }
    
    func setupTextFieldSexText(_ text: String) {
        textFieldSex.text = text
    }

}

private extension ProfileUserView {
    
    func setupUserView() {
        backgroundColor = .white
        
        pickerViewDataSource.profileUserView = self
        pickerViewDelegate.profileUserView = self
        pickerViewAge.dataSource = pickerViewDataSource
        pickerViewAge.delegate = pickerViewDelegate
        pickerViewSex.dataSource = pickerViewDataSource
        pickerViewSex.delegate = pickerViewDelegate
        
        setupPersonFoto()
        setupPersonButton()
        setupStackViewName()
        setupStackViewBirthday()
        setupStackViewAge()
        setupStackViewSex()
        setupStackViewInsta()

        addSubview(personFoto)
        addSubview(personButton)
        addSubview(stackViewName)
        addSubview(stackViewBirthday)
        addSubview(stackViewAge)
        addSubview(stackViewSex)
        addSubview(stackViewInsta)
        
        setupPersonFotoConstraints()
        setupPersonButtonConstraints()
        setupStackViewNameConstraints()
        setupStackViewBirthdayConstraints()
        setupStackViewAgeConstraints()
        setupStackViewSexConstraints()
        setupStackViewInstaConstraints()        
    }
    
    func setupPersonFoto() {
        personFoto.image = UIImage(systemName: "person.crop.circle")
        personFoto.contentMode = .scaleAspectFit
    }
    
    func setupPersonButton() {
        personButton.setTitle("Изменить фото", for: .normal)
        personButton.setTitleColor(.systemBlue, for: .normal)
        personButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        personButton.addTarget(self, action: #selector(personButtonAction), for: .touchUpInside)
    }
    
    @objc func personButtonAction() {
        UIView.animate(withDuration: 0.1, animations: { // задержка 0.1 секунда
            self.personButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) // размер кнопки 90%
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.personButton.transform = CGAffineTransform.identity // возврат размера в исходное состояние
            })
        }
    }
    
    func setupLabelName() {
        labelName.text = "ФИО"
        labelName.font = UIFont.boldSystemFont(ofSize: 10)
        labelName.textColor = .systemBlue
    }
    
    func setupTextFieldName() {
        textFieldName.placeholder = "Введите ФИО"
        setupLineTextField(textFieldName)
    }
    
    func setupStackViewName() {
        setupLabelName()
        setupTextFieldName()
        stackViewName.axis = .vertical
        stackViewName.spacing = 8
        stackViewName.addArrangedSubview(labelName)
        stackViewName.addArrangedSubview(textFieldName)
    }
    
    func setupLabelBirthday() {
        labelBirthday.text = "Дата Рождения"
        labelBirthday.font = UIFont.boldSystemFont(ofSize: 10)
        labelBirthday.textColor = .systemBlue
    }
    
    func setupTextFieldBirthday() {
        textFieldBirthday.placeholder = "Введите дату рождения"
        setupLineTextField(textFieldBirthday)
        
        let datePicker = UIDatePicker()
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged) // действие (target), выполняемое при изменении значения в datePicker
        
        textFieldBirthday.inputView = datePicker // устанавливаем свойству, отвечающему за отображение типа клавиатуры пользователю (inputView), datePicker
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        // DateFormatter в данном контексте используется для форматирования объекта Date
        // DateFormatter позволяет представить дату в удобочитаемой форме для пользователя в соответствии с текущими локальными настройками
        let dateFormatter = DateFormatter() // инициализиируем объект экземпляром DateFormatter для форматирования даты
        dateFormatter.dateStyle = .medium // средний уровень детализации форматирования даты
        dateFormatter.locale = Locale(identifier: "ru_RU")
        textFieldBirthday.text = dateFormatter.string(from: sender.date) // форматируем дату из датапикера и устанавливаем ее в текстовое поле
    }
    
    func setupStackViewBirthday() {
        setupLabelBirthday()
        setupTextFieldBirthday()
        stackViewBirthday.axis = .vertical
        stackViewBirthday.spacing = 8
        stackViewBirthday.addArrangedSubview(labelBirthday)
        stackViewBirthday.addArrangedSubview(textFieldBirthday)
    }
    
    func setupLabelAge() {
        labelAge.text = "Возраст"
        labelAge.font = UIFont.boldSystemFont(ofSize: 10)
        labelAge.textColor = .systemBlue
    }
    
    func setupToolbarAge() {
        toolbarAge.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(agePickerDoneButtonTapped))
        toolbarAge.setItems([doneButton], animated: false)
    }
    
    func setupTextFieldAge() {
        textFieldAge.placeholder = "Укажите возраст"
        setupLineTextField(textFieldAge)
        setupToolbarAge()
        textFieldAge.inputView = pickerViewAge
        textFieldAge.inputAccessoryView = toolbarAge
    }
    
    @objc private func agePickerDoneButtonTapped() {
        textFieldAge.resignFirstResponder() // Закрываем клавиатуру
    }
    
    func setupStackViewAge() {
        setupLabelAge()
        setupTextFieldAge()
        stackViewAge.axis = .vertical
        stackViewAge.spacing = 8
        stackViewAge.addArrangedSubview(labelAge)
        stackViewAge.addArrangedSubview(textFieldAge)
    }
    
    func setupLabelSex() {
        labelSex.text = "Пол"
        labelSex.font = UIFont.boldSystemFont(ofSize: 10)
        labelSex.textColor = .systemBlue
    }
    
    func setupToolbarSex() {
        toolbarSex.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(sexPickerDoneButtonTapped))
        toolbarSex.setItems([doneButton], animated: false)
    }
    
    @objc private func sexPickerDoneButtonTapped() {
        textFieldSex.resignFirstResponder()
    }
    
    func setupTextFieldSex() {
        textFieldSex.placeholder = "Укажите пол"
        setupLineTextField(textFieldSex)
        setupToolbarSex()
        textFieldSex.inputView = pickerViewSex
        textFieldSex.inputAccessoryView = toolbarSex
    }
    
    func setupStackViewSex() {
        setupLabelSex()
        setupTextFieldSex()
        stackViewSex.axis = .vertical
        stackViewSex.spacing = 8
        stackViewSex.addArrangedSubview(labelSex)
        stackViewSex.addArrangedSubview(textFieldSex)
    }
    
    func setupLabelInsta() {
        labelInsta.text = "Инстаграм"
        labelInsta.font = UIFont.boldSystemFont(ofSize: 10)
        labelInsta.textColor = .systemBlue
    }
    
    func setupTextFieldInsta() {
        textFieldInsta.placeholder = "Укажите название аккаунта"
        setupLineTextField(textFieldInsta)
        textFieldInsta.addTarget(self, action: #selector(addTapp), for: .editingDidBegin)
    }
    
    @objc func addTapp() {
        let alert = UIAlertController(title: "Добавить Инстаграм", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Введите название аккаунта"
        }
        
        let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
            guard let textField = alert.textFields?.first, let text = textField.text else { return }
            self?.textFieldInsta.text = text
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        delegate?.navigate(.present(viewController: alert))
    }

    func setupStackViewInsta() {
        setupLabelInsta()
        setupTextFieldInsta()
        stackViewInsta.axis = .vertical
        stackViewInsta.spacing = 8
        stackViewInsta.addArrangedSubview(labelInsta)
        stackViewInsta.addArrangedSubview(textFieldInsta)
    }
    
    func setupPersonFotoConstraints() {
        personFoto.translatesAutoresizingMaskIntoConstraints = false
        
        let top = personFoto.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leading = personFoto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = personFoto.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = personFoto.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupPersonButtonConstraints() {
        personButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = personButton.topAnchor.constraint(equalTo: personFoto.bottomAnchor, constant: 5)
        let leading = personButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = personButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = personButton.heightAnchor.constraint(equalToConstant: 20)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupStackViewNameConstraints() {
        stackViewName.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stackViewName.topAnchor.constraint(equalTo: personButton.bottomAnchor, constant: 20)
        let leading = stackViewName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = stackViewName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = stackViewName.heightAnchor.constraint(equalToConstant: 46)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupStackViewBirthdayConstraints() {
        stackViewBirthday.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stackViewBirthday.topAnchor.constraint(equalTo: stackViewName.bottomAnchor, constant: 10)
        let leading = stackViewBirthday.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = stackViewBirthday.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = stackViewBirthday.heightAnchor.constraint(equalToConstant: 46)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupStackViewAgeConstraints() {
        stackViewAge.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stackViewAge.topAnchor.constraint(equalTo: stackViewBirthday.bottomAnchor, constant: 10)
        let leading = stackViewAge.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = stackViewAge.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = stackViewAge.heightAnchor.constraint(equalToConstant: 46)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupStackViewSexConstraints() {
        stackViewSex.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stackViewSex.topAnchor.constraint(equalTo: stackViewAge.bottomAnchor, constant: 10)
        let leading = stackViewSex.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = stackViewSex.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = stackViewSex.heightAnchor.constraint(equalToConstant: 46)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupStackViewInstaConstraints() {
        stackViewInsta.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stackViewInsta.topAnchor.constraint(equalTo: stackViewSex.bottomAnchor, constant: 10)
        let leading = stackViewInsta.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        let trailing = stackViewInsta.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        let height = stackViewInsta.heightAnchor.constraint(equalToConstant: 46)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupLineTextField(_ textField: UITextField) {
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.masksToBounds = false
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowOffset = CGSize(width: textField.frame.width, height: 1)
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowRadius = 0.0
    }
    
}
