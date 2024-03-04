import UIKit

class UserProfileView: UIView {
    
    private let mainStackView: UIStackView
    
    // элементы mainStackView
    private let stackViewOne: UIStackView
    private let stackViewTwo: UIStackView
    private let stackViewThree: UIStackView
    private let stackViewFour: UIStackView
    
    // элементы stackViewOne
    private let labelStackOne: UILabel
    private let firstImageStackOne: UIImageView
    private let secondImageStackOne: UIImageView
    private let labelContainerView: UIView
    private let imageContainerView: UIStackView
    
    init() {
        self.mainStackView = UIStackView()
        self.stackViewOne = UIStackView()
        self.stackViewTwo = UIStackView()
        self.stackViewThree = UIStackView()
        self.stackViewFour = UIStackView()
        
        self.labelStackOne = UILabel()
        self.firstImageStackOne = UIImageView()
        self.secondImageStackOne = UIImageView()
        self.labelContainerView = UIView()
        self.imageContainerView = UIStackView()
        
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = .green
        addSubview(mainStackView)
        
        setupMainStackViewConstraints()
        
        setupMainStackView()
        setupStackViewOne()
    }
    
    
    func setupMainStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8)
        let leading = mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let bottom = mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        
        NSLayoutConstraint.activate([top, leading, trailing, bottom])
    }
    
    
    func setupMainStackView() {
        mainStackView.axis = .vertical // ось расположения элементов в стековом представлении
        mainStackView.spacing = 10 // расстояние между основными стековыми представлениями внутри mainStackView
        mainStackView.addArrangedSubview(stackViewOne)
        mainStackView.addArrangedSubview(stackViewTwo)
        mainStackView.addArrangedSubview(stackViewThree)
        mainStackView.addArrangedSubview(stackViewFour)
    }
    
    func setupStackViewOne() {
        setupLabelStackOne()
        setupImageContainerView()
        
        stackViewOne.axis = .vertical
        stackViewOne.spacing = 5
        
        // добавление элементов на внутренние представления stackViewOne
        labelContainerView.addSubview(labelStackOne)
        imageContainerView.addArrangedSubview(firstImageStackOne)
        imageContainerView.addArrangedSubview(secondImageStackOne)
    }
    
    func setupLabelStackOne() {
        labelStackOne.text = "True Wallpaper"

        // констрейнты labelStackOne
        labelStackOne.translatesAutoresizingMaskIntoConstraints = false
        let centerX = labelStackOne.centerXAnchor.constraint(equalTo: labelContainerView.centerXAnchor)
        let centerY = labelStackOne.centerYAnchor.constraint(equalTo: labelContainerView.centerYAnchor)
        NSLayoutConstraint.activate([centerX, centerY])
    }
    
    func setupImageContainerView() {
        setupFirstImageStackOne()
        setupSecondImageStackOne()
        
        imageContainerView.contentMode = .scaleAspectFill
        imageContainerView.axis = .horizontal
        imageContainerView.spacing = 5
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupFirstImageStackOne() {
        firstImageStackOne.image = UIImage(named: "1")
        firstImageStackOne.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupSecondImageStackOne() {
        secondImageStackOne.image = UIImage(named: "2")
        secondImageStackOne.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
