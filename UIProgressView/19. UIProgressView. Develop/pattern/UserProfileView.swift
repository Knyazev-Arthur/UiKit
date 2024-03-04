import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var textViewDelegate: TextViewDelegateProtocol { get set }
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var textViewDelegate: TextViewDelegateProtocol
    private let progressView: UIProgressView
    private let button: UIButton
    private var timer: Timer

    init() {
        self.textViewDelegate = TextViewDelegate()
        self.progressView = UIProgressView()
        self.button = UIButton()
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
        backgroundColor = .white
        setupProgressView(progressView)
        setupButton(button)
        setupTimer()
        addSubview(progressView)
        addSubview(button)
        setupProgressViewConstraints()
        setupButtonConstraints()
    }
    
    func setupProgressView(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar // линия прогресса без заливки
        progressView.setProgress(0.0, animated: false) // прогресс будет начинаться/отображаться с нуля
        progressView.progressTintColor = .green // цвет незагруженной полосы
        progressView.trackTintColor = .gray // цвет полосы прогрузки
    }
    
    func setupButton(_ button: UIButton) {
        button.setTitle("загрузка...", for: .normal)
        button.backgroundColor = .red
        button.alpha = 0.2
    }
    
    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateProgressView),
                                     userInfo: self,
                                     repeats: true)
    }
    
    @objc func updateProgressView() {
        if progressView.progress != 1.0 {
            progressView.progress += 0.1 / 1.0
        } else if progressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7) {
                self.button.alpha = 1
                self.button.setTitle("Старт", for: .normal)
                self.timer.invalidate()
            }
        }
    }
    
    func setupProgressViewConstraints() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = progressView.centerXAnchor.constraint(equalTo: centerXAnchor)
        let centerY = progressView.centerYAnchor.constraint(equalTo: centerYAnchor)
        let width = progressView.widthAnchor.constraint(equalToConstant: 150)
        
        NSLayoutConstraint.activate([centerX, centerY, width])
    }
    
    func setupButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = button.centerXAnchor.constraint(equalTo: centerXAnchor)
        let top = button.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 50)
        let height = button.heightAnchor.constraint(equalToConstant: 50)
        let width = button.widthAnchor.constraint(equalToConstant: 150)
        
        NSLayoutConstraint.activate([centerX, top, height, width])
    }
}
