import UIKit
import AVFoundation

// MARK: - PlayerProfileViewProtocol
protocol PlayerProfileViewProtocol: UIView {
    var song: String { get set }
}

class PlayerProfileView: UIView, PlayerProfileViewProtocol {
    
    // каждый раз, когда меняется свойство song, компоненты пользовательского интерфейса перенастраиваются, чтобы отобразить детали новой песни
    var song: String = "" {
        didSet {
            setupPlayerView()
        }
    }
    
    private var player: AVAudioPlayer?
    private let coverSong: UIImageView
    private let nameSong: UILabel
    private let songDurationSlider: UISlider
    private let playButton: UIButton
    
    init() {
        self.coverSong = UIImageView()
        self.nameSong = UILabel()
        self.songDurationSlider = UISlider()
        self.playButton = UIButton()
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPlayerView() {
        backgroundColor = .white
        setupPlayer()
        
        setupCoverSong()
        setupNameSong()
        setupSongDurationSlider()
        setupPlayButton()
        
        addSubview(coverSong)
        addSubview(nameSong)
        addSubview(songDurationSlider)
        addSubview(playButton)
        
        setupCoverSongConstraints()
        setupNameSongConstraints()
        setupSongDurationSliderConstraints()
        setupPlayButtonConstraints()
    }
    
}

private extension PlayerProfileView {
    
    func setupPlayer() {
        do {
            guard let playerPatch = Bundle.main.path(forResource: song, ofType: "mp3") else { return }
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: playerPatch))
        } catch { // если загрузка не удалась
            print("Error")
        }
    }

    func setupCoverSong() {
        coverSong.image = UIImage(named: song)
        coverSong.contentMode = .scaleAspectFit
        coverSong.layer.cornerRadius = 10
        coverSong.layer.masksToBounds = true
        coverSong.layer.borderWidth = 2.0
        coverSong.layer.borderColor = UIColor.black.cgColor
    }
    
    func setupNameSong() {
        nameSong.text = song
        nameSong.numberOfLines = 0
        nameSong.textColor = .black
    }

    func setupSongDurationSlider() {
        songDurationSlider.minimumValue = 00.00
        songDurationSlider.maximumValue = 100
        songDurationSlider.addTarget(self, action: #selector(chengeSlider), for: .touchUpInside)
    }
    
    @objc func chengeSlider(sender: UISlider) {
        player?.currentTime = TimeInterval(sender.value)
    }

    func setupPlayButton() {
        playButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.addTarget(self, action: #selector(tapPlayButton), for: .touchUpInside)
    }
    
    @objc func tapPlayButton() {
        togglePlayPause()
    }

    func togglePlayPause() {
        if let player = player, player.isPlaying {
            player.pause()
            updatePlayButton(isPlaying: false)
        } else {
            player?.play()
            updatePlayButton(isPlaying: true)
        }
    }

    func updatePlayButton(isPlaying: Bool) {
        let imageName = isPlaying ? "pause.fill" : "play.fill"
        playButton.setBackgroundImage(UIImage(systemName: imageName), for: .normal)
    }
    
    func setupCoverSongConstraints() {
        coverSong.translatesAutoresizingMaskIntoConstraints = false
        
        let top = coverSong.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let centerX = coverSong.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let height = coverSong.heightAnchor.constraint(equalToConstant: 300)
        let width = coverSong.widthAnchor.constraint(equalToConstant: 300)
        
        NSLayoutConstraint.activate([top, centerX, height, width])
    }
    
    func setupNameSongConstraints() {
        nameSong.translatesAutoresizingMaskIntoConstraints = false
        
        let top = nameSong.topAnchor.constraint(equalTo: coverSong.bottomAnchor, constant: 16)
        let leading = nameSong.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailing = nameSong.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let height = nameSong.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([top, leading, height, trailing])
    }
    
    func setupSongDurationSliderConstraints() {
        songDurationSlider.translatesAutoresizingMaskIntoConstraints = false
        
        let top = songDurationSlider.topAnchor.constraint(equalTo: nameSong.bottomAnchor, constant: 16)
        let leading = songDurationSlider.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailing = songDurationSlider.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        
        NSLayoutConstraint.activate([top, leading, trailing])
    }
    
    func setupPlayButtonConstraints() {
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = playButton.topAnchor.constraint(equalTo: songDurationSlider.bottomAnchor, constant: 16)
        let centerX = playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let height = playButton.heightAnchor.constraint(equalToConstant: 50)
        let width = playButton.widthAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([top, centerX, height, width])
    }
}
