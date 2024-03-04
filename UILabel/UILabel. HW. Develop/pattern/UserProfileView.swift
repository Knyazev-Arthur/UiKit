import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var controllerDelegate: ViewController? { get set }
    var pickerViewDataSource: PickerViewDataSourceProtocol { get set }
    var pickerViewDelegate: PickerViewDelegateProtocol { get set }
    
    var colorPicker: UIPickerView { get set }
    var linesPicker: UIPickerView { get set }
    var colors: [String] { get set }
    var lines: [String] { get set }
    
    func colorTextLabel(_ color: UIColor)
    func linesLabel(_ numb: Int)
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var pickerViewDataSource: PickerViewDataSourceProtocol
    var pickerViewDelegate: PickerViewDelegateProtocol
    weak var controllerDelegate: ViewController?
    
    var colors: [String]
    var lines: [String]
    var colorPicker: UIPickerView
    var linesPicker: UIPickerView
    
    private let label: UILabel
    private let addButton: UIBarButtonItem
    private let fontSizeSlider: UISlider
    private let stackPicker: UIStackView
    
    init() {
        self.pickerViewDataSource = PickerViewDataSource()
        self.pickerViewDelegate = PickerViewDelegate()
        self.colors = ["Черный", "Красный", "Зеленый", "Синий"]
        self.lines = ["0", "1", "2", "3", "4", "5"]
        self.colorPicker = UIPickerView()
        self.linesPicker = UIPickerView()

        self.label = UILabel()
        self.addButton = UIBarButtonItem()
        self.fontSizeSlider = UISlider()
        self.stackPicker = UIStackView()
        
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupAddButtom()
    }
    
    func colorTextLabel(_ color: UIColor) {
        label.textColor = color
    }
    
    func linesLabel(_ numb: Int) {
        label.numberOfLines = numb
    }
}

private extension UserProfileView {
    
    func setupUserProfileView() {
        pickerViewDelegate.userProfileView = self
        pickerViewDataSource.userProfileView = self

        backgroundColor = UIColor(ciColor: .cyan)
        
        setupLabel()
        setupFontSizeSlider()
        setupStackPicker()
        
        addSubview(label)
        addSubview(fontSizeSlider)
        addSubview(stackPicker)
        
        setupLabelConstraints()
        setupFontSizeSliderConstraints()
        setupStackPickerConstraints()
    }
    
    func setupLabel() {
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
    }
    
    func setupAddButtom() {
        addButton.image = UIImage(systemName: "plus")
        addButton.target = self
        addButton.action = #selector(addTap)
        controllerDelegate?.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addTap() {
        let alert = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert) // объявляем экземпляр alertControllera
        
        alert.addTextField { textField in textField.placeholder = "Текст" } // инициализируем массив textField alertControllera
        
        let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in // объявляем экземпляр UIAlertAction для инициализации кнопки "Добавить" на alertController
            guard let textField = alert.textFields?.first, let text = textField.text else { return } // проверка на наличие textField
            self?.label.text = text
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        // добавляем кнопки на панель alertControllera
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        // добавляем alertController на главный контроллер
        controllerDelegate?.present(alert, animated: true)
    }
    
    func setupFontSizeSlider() {
        fontSizeSlider.minimumValue = 0
        fontSizeSlider.maximumValue = 100
        fontSizeSlider.addTarget(self, action: #selector(fontSizeChanged), for: .valueChanged)
    }
    
    @objc func fontSizeChanged(_ sender: UISlider) {
        label.font = label.font.withSize(CGFloat(sender.value))
    }
    
    func setupColorPicker() {
        colorPicker.delegate = pickerViewDelegate
        colorPicker.dataSource = pickerViewDataSource
    }
    
    func setupLinesPicker() {
        linesPicker.delegate = pickerViewDelegate
        linesPicker.dataSource = pickerViewDataSource
    }
    
    func setupStackPicker() {
        setupColorPicker()
        setupLinesPicker()
        
        stackPicker.axis = .horizontal
        stackPicker.spacing = 8
        stackPicker.distribution = .fillEqually

        stackPicker.addArrangedSubview(colorPicker)
        stackPicker.addArrangedSubview(linesPicker)
    }
    
    func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let top = label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leading = label.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailing = label.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let height = label.heightAnchor.constraint(equalToConstant: 300)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupFontSizeSliderConstraints() {
        fontSizeSlider.translatesAutoresizingMaskIntoConstraints = false
        
        let top = fontSizeSlider.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        let leading = fontSizeSlider.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailing = fontSizeSlider.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let height = fontSizeSlider.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupStackPickerConstraints() {
        stackPicker.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stackPicker.topAnchor.constraint(equalTo: fontSizeSlider.bottomAnchor, constant: 20)
        let leading = stackPicker.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailing = stackPicker.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let height = stackPicker.heightAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
}
