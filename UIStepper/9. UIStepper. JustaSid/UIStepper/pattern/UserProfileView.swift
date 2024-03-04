import UIKit

class UserProfileView: UIView {
    
    private let titleLabel: UILabel
    private let itemImageView: UIImageView
    private var segmentedControl: UISegmentedControl = UISegmentedControl(items: ["32 см","48 см","52 см"])
    private let descriptionLabel: UILabel
    private let stepper: UIStepper
    private let sendButton: UIButton
    
    init() {
        self.titleLabel = UILabel()
        self.itemImageView = UIImageView()
        self.descriptionLabel = UILabel()
        self.stepper = UIStepper()
        self.sendButton = UIButton()
        
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserProfileView() {
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(itemImageView)
        addSubview(segmentedControl)
        addSubview(descriptionLabel)
        addSubview(stepper)
        addSubview(sendButton)
        
        setupElements()
    }
    
    private func setupElements() {
        setupTitleLabelConstraints()
        setupItemImageViewConstraints()
        setupSegmentedControlConstraints()
        setupDescriptionLabelConstraints()
        setupStepperConstraints()
        setupSendButtonConstraints()
        
        setupTitleLabel()
        setupItemImageView()
        setupSegmentedControl()
        setupDescriptionLabel()
        setupStepper()
        setupSendButton()
    }
    
    private func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
        let centerX = titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let bottom = titleLabel.bottomAnchor.constraint(equalTo: itemImageView.topAnchor, constant: -16)
        
        NSLayoutConstraint.activate([top, centerX, bottom])
    }
    
    private func setupItemImageViewConstraints() {
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let width = itemImageView.widthAnchor.constraint(equalToConstant: 350)
        let height = itemImageView.heightAnchor.constraint(equalToConstant: 350)
        let centerX = itemImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        
        NSLayoutConstraint.activate([width,height,centerX])
    }
    
    private func setupSegmentedControlConstraints() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
                    
        let top = segmentedControl.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 16)
        let leading = segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
                    
        NSLayoutConstraint.activate([top,trailing,leading])
    }

    private func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = descriptionLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16)
        let leading = descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let width = descriptionLabel.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([leading, width, top])
    }
    
    private func setupStepperConstraints() {
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stepper.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16)
        let trailing = stepper.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        NSLayoutConstraint.activate([trailing, top])
    }
    
    private func setupSendButtonConstraints() {
        sendButton.translatesAutoresizingMaskIntoConstraints = false
    
        let top = sendButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16)
        let centerX = sendButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let height = sendButton.heightAnchor.constraint(equalToConstant: 30)
        let width = sendButton.widthAnchor.constraint(equalToConstant: 300)
    
        NSLayoutConstraint.activate([height, width, top, centerX])
    }
        
    private func setupTitleLabel() {
        titleLabel.text = "Пеперони"
        titleLabel.font = UIFont.systemFont(ofSize: 33)
        titleLabel.textAlignment = .center
    }
    
    private func setupItemImageView() {
        itemImageView.layer.cornerRadius = 15
        itemImageView.clipsToBounds = true // обрезаем изображение по границам
        itemImageView.contentMode = .scaleAspectFill // маштабируем изображние для полного заполнения в пределах границы
        itemImageView.image = UIImage(named: "pizza")
    }
    
    private func setupSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0 // при запуске приложения будет выбран элемент массива под индексом 0
        segmentedControl.addTarget(self, action: #selector(segmentedAction), for: .valueChanged)
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "пицца Пеперони 32 см в количестве - 1 шт."
        descriptionLabel.textAlignment = .center
    }
    
    private func setupStepper() {
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.value = 1
        stepper.addTarget(self, action: #selector(stepperAction), for: .valueChanged)
    }
    
    private func setupSendButton() {
        sendButton.setTitle("Добавить", for: .normal)
        sendButton.setTitleColor(.blue, for: .normal)
        sendButton.setTitleColor(.darkGray, for: .highlighted)
        sendButton.layer.cornerRadius = 10
        sendButton.backgroundColor = UIColor(red: 220/252, green: 220/252, blue: 220/252, alpha: 0.9)
        sendButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc private func segmentedAction(_ sender: UISegmentedControl) {
        guard let index = sender.titleForSegment(at: segmentedControl.selectedSegmentIndex) else { return }
        descriptionLabel.text = "пицца Пеперони \(index) в количестве - \(Int(stepper.value)) шт."
    }
    
    @objc private func stepperAction(_ sender: UIStepper) {
        guard let index = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) else { return }
        descriptionLabel.text = "пицца Пеперони \(index) в количестве - \(Int(sender.value)) шт."
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        print("Добавлено")
    }
}
