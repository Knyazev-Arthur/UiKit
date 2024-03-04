import UIKit
import AVFoundation

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var delegate: UserViewController? { get set }
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    weak var delegate: UserViewController?
    private let coverSongOne: UIImageView
    private let timeSongOne: UILabel
    private let nameSongOne: UILabel
    private let playSongOne: UIButton
    private let stackSongOne: UIStackView

    private let coverSongTwo: UIImageView
    private let timeSongTwo: UILabel
    private let nameSongTwo: UILabel
    private let playSongTwo: UIButton
    private let stackSongTwo: UIStackView

    init() {
        self.coverSongOne = UIImageView()
        self.timeSongOne = UILabel()
        self.nameSongOne = UILabel()
        self.playSongOne = UIButton()
        self.stackSongOne = UIStackView()
        
        self.coverSongTwo = UIImageView()
        self.timeSongTwo = UILabel()
        self.nameSongTwo = UILabel()
        self.playSongTwo = UIButton()
        self.stackSongTwo = UIStackView()
        
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
        
        setupCoverSongOne()
        setupStackSongOne()
        setupCoverSongTwo()
        setupStackSongTwo()
        
        addSubview(coverSongOne)
        addSubview(stackSongOne)
        addSubview(coverSongTwo)
        addSubview(stackSongTwo)
        
        setupCoverSongOneConstraints()
        setupStackSongOneConstraints()
        setupCoverSongTwoConstraints()
        setupStackSongTwoConstraints()
    }
    
    func setupCoverSongOne() {
        coverSongOne.image = UIImage(named: "Thunder")
        coverSongOne.contentMode = .scaleAspectFit
        coverSongOne.layer.cornerRadius = 10
        coverSongOne.layer.masksToBounds = true
        coverSongOne.layer.borderWidth = 2.0
        coverSongOne.layer.borderColor = UIColor.white.cgColor
    }
    
    func setupTimeSongOne() {
//        settingDuration(song: "Thunder", label: timeSongOne)
        timeSongOne.text = "Thunder".duration()
        timeSongOne.numberOfLines = 0
        timeSongOne.textColor = .black
    }
    
    func setupNameSongOne() {
        nameSongOne.text = "Image Dragons - Thunder"
        nameSongOne.numberOfLines = 0
        nameSongOne.textColor = .black
    }
    
    func setupPlaySongOne() {
        playSongOne.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playSongOne.addTarget(self, action: #selector(tapPlaySongOne), for: .touchUpInside)
        
    }
    
    @objc func tapPlaySongOne() {
        playSongOne.setupTapButton()
        let controller = PlayerViewController()
        delegate?.present(controller, animated: true)
        controller.playerProfileView.song = "Thunder"
    }
    
    func setupStackSongOne() {
        setupTimeSongOne()
        setupNameSongOne()
        setupPlaySongOne()
        stackSongOne.axis = .vertical
        stackSongOne.alignment = .leading
        stackSongOne.distribution = .fillEqually
        stackSongOne.addArrangedSubview(nameSongOne)
        stackSongOne.addArrangedSubview(timeSongOne)
        stackSongOne.addArrangedSubview(playSongOne)
    }
    
    func setupCoverSongTwo() {
        coverSongTwo.image = UIImage(named: "Count Me Out")
        coverSongTwo.contentMode = .scaleAspectFit
        coverSongTwo.layer.cornerRadius = 10
        coverSongTwo.layer.masksToBounds = true
        coverSongTwo.layer.borderWidth = 2.0
        coverSongTwo.layer.borderColor = UIColor.white.cgColor
    }
    
    func setupTimeSongTwo() {
        timeSongTwo.text = "Count Me Out".duration()
        timeSongTwo.numberOfLines = 0
        timeSongTwo.textColor = .black
    }
    
    func setupNameSongTwo() {
        nameSongTwo.text = "Kendrick L - Count Me Out"
        nameSongTwo.numberOfLines = 0
        nameSongTwo.textColor = .black
    }
    
    func setupPlaySongTwo() {
        playSongTwo.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playSongTwo.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        playSongTwo.addTarget(self, action: #selector(tapPlaySongTwo), for: .touchUpInside)
    }
    
    @objc func tapPlaySongTwo() {
        playSongTwo.setupTapButton()
        let controller = PlayerViewController()
        delegate?.present(controller, animated: true)
        controller.playerProfileView.song = "Count Me Out"
    }
    
    func setupStackSongTwo() {
        setupTimeSongTwo()
        setupNameSongTwo()
        setupPlaySongTwo()
        stackSongTwo.axis = .vertical
        stackSongTwo.alignment = .leading
        stackSongTwo.distribution = .fillEqually
        stackSongTwo.addArrangedSubview(nameSongTwo)
        stackSongTwo.addArrangedSubview(timeSongTwo)
        stackSongTwo.addArrangedSubview(playSongTwo)
    }
    
    func setupCoverSongOneConstraints() {
        coverSongOne.translatesAutoresizingMaskIntoConstraints = false
        
        let top = coverSongOne.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leading = coverSongOne.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let width = coverSongOne.widthAnchor.constraint(equalToConstant: 100)
        let height = coverSongOne.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, leading, width, height])
    }
    
    func setupStackSongOneConstraints() {
        stackSongOne.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stackSongOne.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leading = stackSongOne.leadingAnchor.constraint(equalTo: coverSongOne.trailingAnchor, constant: 16)
        let trailing = stackSongOne.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let height = stackSongOne.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupCoverSongTwoConstraints() {
        coverSongTwo.translatesAutoresizingMaskIntoConstraints = false
        
        let top = coverSongTwo.topAnchor.constraint(equalTo: coverSongOne.bottomAnchor, constant: 16)
        let leading = coverSongTwo.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let width = coverSongTwo.widthAnchor.constraint(equalToConstant: 100)
        let height = coverSongTwo.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, leading, width, height])
    }
    
    func setupStackSongTwoConstraints() {
        stackSongTwo.translatesAutoresizingMaskIntoConstraints = false
        
        let top = stackSongTwo.topAnchor.constraint(equalTo: stackSongOne.bottomAnchor, constant: 16)
        let leading = stackSongTwo.leadingAnchor.constraint(equalTo: coverSongTwo.trailingAnchor, constant: 16)
        let trailing = stackSongTwo.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let height = stackSongTwo.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
}
