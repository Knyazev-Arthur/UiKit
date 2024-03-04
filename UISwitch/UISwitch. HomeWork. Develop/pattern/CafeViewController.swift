import UIKit

class CafeViewController: UIViewController {
    
    private let nameLabel: UILabel
    private let nameTextField: UITextField
    private let nameBottomLine: CALayer
    private let guestsLabel: UILabel
    private let guestsTextField: UITextField
    private let guestsBottomLine: CALayer
    private let tableLabel: UILabel
    private let tableTextField: UITextField
    private let tableBottomLine: CALayer
    private let bookingLabel: UILabel
    private let bookingSwitch: UISwitch
    private let bookingStackView: UIStackView
    private let prepaymentLabel: UILabel
    private let prepaymentSwitch: UISwitch
    private let prepaymentStackView: UIStackView
    private let vipLabel: UILabel
    private let vipSwitch: UISwitch
    private let vipStackView: UIStackView
    private let button: UIButton

    init() {
        self.nameLabel = UILabel()
        self.nameTextField = UITextField()
        self.nameBottomLine = CALayer()
        self.guestsLabel = UILabel()
        self.guestsTextField = UITextField()
        self.guestsBottomLine = CALayer()
        self.tableLabel = UILabel()
        self.tableTextField = UITextField()
        self.tableBottomLine = CALayer()
        self.bookingLabel = UILabel()
        self.bookingSwitch = UISwitch()
        self.bookingStackView = UIStackView()
        self.prepaymentLabel = UILabel()
        self.prepaymentSwitch = UISwitch()
        self.prepaymentStackView = UIStackView()
        self.vipLabel = UILabel()
        self.vipSwitch = UISwitch()
        self.vipStackView = UIStackView()
        self.button = UIButton()
        
        super.init(nibName: nil, bundle: nil)
        setupUserView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setting(a: nameBottomLine, textField: nameTextField)
        setting(a: guestsBottomLine, textField: guestsTextField)
        setting(a: tableBottomLine, textField: tableTextField)
    }
}

private extension CafeViewController {
    
    func setupUserView() {
        title = "Cafe Mario"
        view.backgroundColor = .white
        
        setupNameLabel()
        setupNameTextField()
        setupGuestsLabel()
        setupGuestsTextField()
        setupTableLabel()
        setupTableTextField()
        setupBookingStackView()
        setupPrepaymentStackView()
        setupVipStackView()
        setupButton()
        
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(guestsLabel)
        view.addSubview(guestsTextField)
        view.addSubview(tableLabel)
        view.addSubview(tableTextField)
        view.addSubview(bookingStackView)
        view.addSubview(prepaymentStackView)
        view.addSubview(vipStackView)
        view.addSubview(button)
        
        setupNameLabelConstraints()
        setupNameTextFieldConstraints()
        setupGuestsLabelConstraints()
        setupGuestsTextFieldConstraints()
        setupTableLabelConstraints()
        setupTableTextFieldConstraints()
        setupBookingStackViewConstraints()
        setupPrepaymentStackViewConstraints()
        setupVipStackViewConstraints()
        setupButtonConstraints()
    }
    
    func setupNameLabel() {
        nameLabel.text = "ФИО"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 12)
        nameLabel.textColor = .orange
    }
    
    func setupNameTextField() {
        nameTextField.placeholder = "Введите ФИО"
        nameTextField.layer.addSublayer(nameBottomLine)
    }
    
    func setupGuestsLabel() {
        guestsLabel.text = "Количество гостей"
        guestsLabel.font = UIFont.boldSystemFont(ofSize: 12)
        guestsLabel.textColor = .orange
    }
    
    func setupGuestsTextField() {
        guestsTextField.placeholder = "Введите количество"
        guestsTextField.layer.addSublayer(guestsBottomLine)
    }
    
    func setupTableLabel() {
        tableLabel.text = "Номер стола"
        tableLabel.font = UIFont.boldSystemFont(ofSize: 12)
        tableLabel.textColor = .orange
    }
    
    func setupTableTextField() {
        tableTextField.placeholder = "Введите номер"
        tableTextField.layer.addSublayer(tableBottomLine)
    }
    
    func setupBookingLabel() {
        bookingLabel.text = "Бронировали стол?"
        bookingLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func setupBookingStackView() {
        setupBookingLabel()
        bookingStackView.spacing = 8
        bookingStackView.addArrangedSubview(bookingLabel)
        bookingStackView.addArrangedSubview(bookingSwitch)
    }
    
    func setupPrepaymentLabel() {
        prepaymentLabel.text = "Наличие предоплаты?"
        prepaymentLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func setupPrepaymentStackView() {
        setupPrepaymentLabel()
        prepaymentStackView.spacing = 8
        prepaymentStackView.addArrangedSubview(prepaymentLabel)
        prepaymentStackView.addArrangedSubview(prepaymentSwitch)
    }
    
    func setupVipLabelLabel() {
        vipLabel.text = "VIP комната?"
        vipLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func setupVipStackView() {
        setupVipLabelLabel()
        vipStackView.spacing = 8
        vipStackView.addArrangedSubview(vipLabel)
        vipStackView.addArrangedSubview(vipSwitch)
    }
    
    func setupButton() {
        button.setTitle("Выставить счет", for: .normal)
        button.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1.0)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction() {
        setupAlert()
        
        UIView.animate(withDuration: 0.1, animations: {
            self.button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) // Уменьшаем масштаб кнопки при нажатии
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.button.transform = CGAffineTransform.identity // Возвращаем обычный масштаб кнопки
            })
        }
    }
    
    func setupAlert() {
        let alertController = UIAlertController(title: "Выставить чек?", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Чек", style: .default) { _ in
            let controller = BillViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        alertController.addAction(action)
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func setupNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        let leading = nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = nameLabel.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupNameTextFieldConstraints() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5)
        let leading = nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = nameTextField.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupGuestsLabelConstraints() {
        guestsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = guestsLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20)
        let leading = guestsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = guestsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = guestsLabel.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupGuestsTextFieldConstraints() {
        guestsTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = guestsTextField.topAnchor.constraint(equalTo: guestsLabel.bottomAnchor, constant: 5)
        let leading = guestsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = guestsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = guestsTextField.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupTableLabelConstraints() {
        tableLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = tableLabel.topAnchor.constraint(equalTo: guestsTextField.bottomAnchor, constant: 20)
        let leading = tableLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = tableLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = tableLabel.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupTableTextFieldConstraints() {
        tableTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = tableTextField.topAnchor.constraint(equalTo: tableLabel.bottomAnchor, constant: 5)
        let leading = tableTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = tableTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = tableTextField.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupBookingStackViewConstraints() {
        bookingStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = bookingStackView.topAnchor.constraint(equalTo: tableTextField.bottomAnchor, constant: 40)
        let leading = bookingStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = bookingStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = bookingStackView.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupPrepaymentStackViewConstraints() {
        prepaymentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = prepaymentStackView.topAnchor.constraint(equalTo: bookingStackView.bottomAnchor, constant: 15)
        let leading = prepaymentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = prepaymentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = prepaymentStackView.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupVipStackViewConstraints() {
        vipStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = vipStackView.topAnchor.constraint(equalTo: prepaymentStackView.bottomAnchor, constant: 15)
        let leading = vipStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = vipStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = vipStackView.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let top = button.topAnchor.constraint(equalTo: vipStackView.bottomAnchor, constant: 40)
        let leading = button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailing = button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let height = button.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setting(a line: CALayer, textField: UITextField) {
        line.frame = CGRect(origin: CGPoint(x: 0, y: textField.frame.height - 1),
                                      size: CGSize(width: textField.frame.width, height: 1))
        line.backgroundColor = UIColor.gray.cgColor
        line.opacity = 0.5
    }
}
