import UIKit
import AVFoundation

class UserProfileView: UIView {
    
    private let label = UILabel()
    private let datePicker = UIDatePicker()
    private let button = UIButton()
    
    private var alarmDate = Double()
    private var count = Int()
    private var timer = Timer()
    private var player = AVAudioPlayer()
    
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
        addSubview(datePicker)
        addSubview(button)
    }
    
    private func setupElementsConstrains() {
        setupLabelConstraints()
        setupButtonConstraints()
        setupDatePickerConstraints()
    }
    
    private func setupElements() {
        setupLabel()
        setupButton()
        setupDatePicker()
    }
    
    private func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let top = label.topAnchor.constraint(equalTo: self.topAnchor, constant: 100)
        let centerX = label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = label.widthAnchor.constraint(equalToConstant: 200)
        let height = label.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([width, height, top, centerX])
    }
    
    private func setupDatePickerConstraints() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        let top = datePicker.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15)
        let centerX = datePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        
        NSLayoutConstraint.activate([top, centerX])
    }
    
    private func setupButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let top = button.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 15)
        let centerX = button.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = button.widthAnchor.constraint(equalToConstant: 200)
        let height = button.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([width, height, top, centerX])
    }
    
    private func setupLabel() {
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 2
        label.font = label.font.withSize(30)
    }
    
    private func setupDatePicker() {
        datePicker.addTarget(self, action: #selector(datePickerAction), for: .valueChanged)
    }
    
    private func setupButton() {
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    private func createTimer() {
        timer = .scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            if self.count == 0 {
                self.stopTimer()
                self.playSound()
            } else {
                self.count -= 1
                self.label.text = "\(self.count)"
            }
        })
    }
    
    private func playSound() {
        guard let url = Bundle.main.url(forResource: "ring", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("Error")
        }
        player.play()
    }
    
    private func stopSound() {
        player.stop()
    }
    
    private func stopTimer() {
        timer.invalidate() // остановка таймера
    }
    
    @objc private func datePickerAction(_ sender: UIDatePicker) {
        alarmDate = sender.date.timeIntervalSince1970 // присваиваем константе кол-во секунд, прошедших с начала времени
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        let currentTime = Date().timeIntervalSince1970
        
        if sender.title(for: .normal) == "Start" {
            if alarmDate > currentTime {
                sender.setTitle("Stop", for: .normal)
                count = Int(self.alarmDate) - Int(currentTime)
                createTimer()
            } else {
                print("Выбранное время уже прошло.")
            }
        } else {
            sender.setTitle("Start", for: .normal)
            stopSound()
        }
    }
}
