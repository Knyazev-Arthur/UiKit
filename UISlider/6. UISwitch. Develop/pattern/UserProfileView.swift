import UIKit
import AVFoundation // фреймворк для работы с медиафайлами

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    private var player: AVAudioPlayer
    private let playButton: UIButton
    private let stopButtom: UIButton
    private let sliderTime: UISlider
    private let sliderVolume: UISlider

    
    init() {
        self.player = AVAudioPlayer()
        self.playButton = UIButton()
        self.stopButtom = UIButton()
        self.sliderTime = UISlider()
        self.sliderVolume = UISlider()
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = UIColor(ciColor: .cyan)
        setupPlayer()
        
        setupSliderTime()
        setupSliderVolume()
        setupPlayButton()
        setupStopButton()
        
        addSubview(sliderTime)
        addSubview(sliderVolume)
        addSubview(playButton)
        addSubview(stopButtom)
        
        setupSliderTimeConstraints()
        setupSliderVolumeConstraints()
        setupPlayButtonConstraints()
        setupStopButtonConstraints()
    }
    
    
    
    
    
    
    func setupPlayer() {
        // реализация воспроизведения песни через обработчик ошибок
        do {
            guard let playerPatch = Bundle.main.path(forResource: "Thunder", ofType: "mp3") else { return } // инициализируем файл
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: playerPatch)) // попытка загрузки
        } catch { // если загрузка не удалась
            print("Error")
        }

    }
    
    
    
    
    
    func setupPlayButton() {
        playButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
    }
    
    @objc func play() {
        player.play()
    }
    
    func setupStopButton() {
        stopButtom.setBackgroundImage(UIImage(systemName: "pause"), for: .normal)
        stopButtom.addTarget(self, action: #selector(stop), for: .touchUpInside)
    }
    
    @objc func stop() {
        player.stop()
    }
    
    func setupSliderTime() {
        sliderTime.minimumValue = 0.0
        sliderTime.maximumValue = Float(player.duration)
        sliderTime.addTarget(self, action: #selector(chengeSlider), for: .valueChanged)
    }
    
    @objc func chengeSlider(sender: UISlider) {
        player.currentTime = TimeInterval(sender.value)// инициализируем свойству текущего времени позицию бегунка
    }
    
    func setupSliderVolume() {
        sliderVolume.addTarget(self, action: #selector(volume), for: .valueChanged)
    }
    
    @objc func volume(sender: UISlider) {
        player.volume = sliderVolume.value
    }
    
    
    
    
    
    
    
    func setupSliderTimeConstraints() {
        sliderTime.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = sliderTime.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerY = sliderTime.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let leading = sliderTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = sliderTime.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        NSLayoutConstraint.activate([centerX, centerY, leading, trailing])
    }
    
    func setupSliderVolumeConstraints() {
        sliderVolume.translatesAutoresizingMaskIntoConstraints = false
        
        let top = sliderVolume.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let centerX = sliderVolume.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let leading = sliderVolume.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = sliderVolume.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        NSLayoutConstraint.activate([centerX, top, leading, trailing])
    }
    
    func setupPlayButtonConstraints() {
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = playButton.topAnchor.constraint(equalTo: sliderTime.bottomAnchor, constant: 16)
        let leading = playButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let height = playButton.heightAnchor.constraint(equalToConstant: 60)
        let width = playButton.widthAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([top, leading, height, width])
    }
    
    func setupStopButtonConstraints() {
        stopButtom.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stopButtom.topAnchor.constraint(equalTo: sliderTime.bottomAnchor, constant: 16)
        let trailing = stopButtom.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let height = stopButtom.heightAnchor.constraint(equalToConstant: 60)
        let width = stopButtom.widthAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([top, trailing, height, width])
    }

}
