import UIKit

class CarViewController: UIViewController {
    
    private let carImage = UIImageView()
    private let nameLabel = UILabel()
    private lazy var subView = [self.carImage, self.nameLabel]
        
    init(carWith: CarsHelper) {
        super.init(nibName: nil, bundle: nil)
        carImage.image = carWith.image
        nameLabel.text = carWith.name
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CarViewController {
    
    func setupUserProfileView() {
        view.backgroundColor = .purple
        setupCarImage()
        setupNameLabel()
        
        view.addSubview(carImage)
        view.addSubview(nameLabel)
        
        setupCarImageConstraints()
        setupNameLabelConstraints()
    }
    
    func setupCarImage() {
        carImage.layer.cornerRadius = 20
        carImage.layer.masksToBounds = true
        carImage.contentMode = .scaleAspectFit
    }
    
    func setupNameLabel() {
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 30)
    }
    
    func setupCarImageConstraints() {
        carImage.translatesAutoresizingMaskIntoConstraints = false
        
        let top = carImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let bottom = carImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        let leading = carImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trailing = carImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        
        NSLayoutConstraint.activate([top, bottom, leading, trailing])
    }
    
    func setupNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = nameLabel.bottomAnchor.constraint(equalTo: carImage.bottomAnchor, constant: 16)
        let centerX = nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        NSLayoutConstraint.activate([top, centerX])
    }
    
}
