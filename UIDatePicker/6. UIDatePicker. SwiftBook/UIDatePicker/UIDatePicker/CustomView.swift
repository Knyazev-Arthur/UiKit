import UIKit

class CustomView: UIView {

    init() {
        super.init(frame: .zero)
        setupCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private let label = UILabel()
    private let datePicker = UIDatePicker()
    
    private func setupCustomView() {
        backgroundColor = .yellow
        addSubview(label)
        addSubview(datePicker)
        setupElements()
        setupElementsConstraints()
    }
    
    private func setupElements() {
        setupLabel()
        setupDatePicker()
    }
    
    private func setupElementsConstraints() {
        setupLabelConstraints()
        datePickerConstraints()
    }
    
    private func setupLabel() {
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
    }
    
    private func setupDatePicker() {
        datePicker.locale = Locale(identifier: "ru-RU")
        datePicker.addTarget(self, action: #selector(addDatePicker), for: .valueChanged)
    }
    
    @objc private func addDatePicker(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru-RU")
        
        label.text = dateFormatter.string(from: sender.date)
    }
    
    private func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let top = label.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        let centerX = label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = label.widthAnchor.constraint(equalToConstant: 300)
        let height = label.heightAnchor.constraint(equalToConstant: 60)
        
        NSLayoutConstraint.activate([top,centerX,width,height])
    }
    
    private func datePickerConstraints() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        let top = datePicker.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100)
        let centerX = datePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        
        NSLayoutConstraint.activate([top,centerX])
    }
}
