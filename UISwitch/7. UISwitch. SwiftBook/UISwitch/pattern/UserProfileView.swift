import UIKit

class UserProfileView: UIView {
    
    private let label = UILabel()
    private let switchLabel = UILabel()
    private let mySwitch = UISwitch()
    
    init() {
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUserProfileView() {
        backgroundColor = .orange
        addSubviewElements()
        setupElementsConstrains()
        setupElements()
    }
    
    private func addSubviewElements() {
        addSubview(label)
        addSubview(switchLabel)
        addSubview(mySwitch)
    }
    
    private func setupElementsConstrains() {
        setupLabelConstraints()
        setupSwitchLabelConstraints()
        setupMySwitchConstraints()
    }
    
    private func setupElements() {
        setupLabel()
        setupSwitchLabel()
        setupMySwitch()
    }
    
    private func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let centerY = label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let centerX = label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = label.widthAnchor.constraint(equalToConstant: 200)
        let height = label.heightAnchor.constraint(equalToConstant: 75)
        
        NSLayoutConstraint.activate([width, height, centerY, centerX])
    }
    
    private func setupSwitchLabelConstraints() {
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = switchLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 60)
        let leading = switchLabel.leadingAnchor.constraint(equalTo: label.leadingAnchor)
        let trailing = switchLabel.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: -30)
        let height = switchLabel.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([leading, trailing, top, height])
    }
    
    private func setupMySwitchConstraints() {
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        
        let top = mySwitch.topAnchor.constraint(equalTo: switchLabel.topAnchor)
        let leading = mySwitch.leadingAnchor.constraint(equalTo: switchLabel.trailingAnchor,constant: 5)
        
        NSLayoutConstraint.activate([top, leading])
    }
    
    private func setupLabel() {
        label.text = "Всем привет.\nЯ текст для проверки.\nМеня должны снести)"
        label.numberOfLines = 0
        label.textAlignment = .left
    }
    
    private func setupSwitchLabel() {
        switchLabel.textAlignment = .left
        switchLabel.numberOfLines = 0
        switchLabel.text = "Скрыть текст для проверки"
        
    }
    
    private func setupMySwitch() {
        mySwitch.addTarget(self, action: #selector(mySwitchAction), for: .valueChanged)
    }
    
    @objc private func mySwitchAction(_ sender: UISwitch) {
        label.isHidden = !label.isHidden
        
        if mySwitch.isOn {
            switchLabel.text = "Отобразить текст для проверки"
        } else {
            switchLabel.text = "Скрыть текст для проверки"
        }
    }
}
