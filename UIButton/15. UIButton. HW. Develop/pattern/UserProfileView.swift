import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    private let label: UILabel
    private let playButton: UIButton
    private var timer: Timer
    private let resetButton: UIButton
    private var isRunning: Bool
    private var seconds: Int
    
    init() {
        self.label = UILabel()
        self.playButton = UIButton()
        self.resetButton = UIButton()
        self.isRunning = false
        self.seconds = Int()
        self.timer = Timer()
        
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = .cyan
        
        setupLabel()
        setupPlayButton()
        setupResetButton()
        
        addSubview(label)
        addSubview(playButton)
        addSubview(resetButton)
        
        setupLabelConstraints()
        setupPlayButtonConstraints()
        setupResetButtonConstraints()
    }
    
    func setupLabel() {
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 5
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textAlignment = .center
        label.text = "0"
    }
    
    func setupPlayButton() {
        playButton.setupButton()
        playButton.setTitle("Старт", for: .normal)
        playButton.addTarget(self, action: #selector(playButtonTap), for: .touchUpInside)
    }
    
    @objc func playButtonTap(_ button: UIButton) {
        button.setupTapButton()
        if isRunning { // если isRunning = true (если таймер запущен)
            timer.invalidate() // остановка таймера
            playButton.setTitle("Старт", for: .normal) // замена текста кнопки
        } else { // если таймер не запущен
            playButton.setTitle("Пауза", for: .normal) // замена текста кнопки
            timer = Timer.scheduledTimer(timeInterval: 1, // запуск таймера с ходом в 1-у секунду
                                         target: self,
                                         selector: #selector(updateTimer), // вызов метода увеличивающего значение лейбла на еденицу
                                         userInfo: nil,
                                         repeats: true)
        }
        isRunning.toggle() // замена isRunning на противоположное значение
    }
    
    @objc func updateTimer() {
        seconds += 1
        label.text = "\(seconds)"
    }
    
    func setupResetButton() {
        resetButton.setupButton()
        resetButton.setTitle("Сброс", for: .normal)
        resetButton.addTarget(self, action: #selector(resetButtonTap), for: .touchUpInside)
    }
    
    @objc func resetButtonTap(_ button: UIButton) {
        button.setupTapButton()
        timer.invalidate() // остановка таймера
        seconds = 0 // обнуляем счетчик
        label.text = "0" // обнуляем лейбл
        playButton.setTitle("Старт", for: .normal) // замена текста кнопки
        isRunning = false
    }
    
    func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerY = label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let height = label.heightAnchor.constraint(equalToConstant: 60)
        let width = label.widthAnchor.constraint(equalToConstant: 180)
        
        NSLayoutConstraint.activate([centerX, centerY, height, width])
    }
    
    func setupPlayButtonConstraints() {
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let top = playButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16)
        let height = playButton.heightAnchor.constraint(equalToConstant: 60)
        let width = playButton.widthAnchor.constraint(equalToConstant: 180)
        
        NSLayoutConstraint.activate([centerX, top, height, width])
    }
    
    func setupResetButtonConstraints() {
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = resetButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let top = resetButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 16)
        let height = resetButton.heightAnchor.constraint(equalToConstant: 60)
        let width = resetButton.widthAnchor.constraint(equalToConstant: 180)
        
        NSLayoutConstraint.activate([centerX, top, height, width])
    }
    
}
