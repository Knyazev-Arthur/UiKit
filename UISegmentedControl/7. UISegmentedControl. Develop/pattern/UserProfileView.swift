import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    private let segmentedControll: UISegmentedControl
    private let imageView: UIImageView
    private let menuArray = ["one", "two", "three"]
    private let imageArray = [(UIImage(named: "crocs1")),
                              (UIImage(named: "crocs2")),
                              (UIImage(named: "crocs3"))]
    
    init() {
        self.segmentedControll = UISegmentedControl.init(items: menuArray)
        self.imageView = UIImageView()
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
        
        setupSegmentedControll()
        setupImageView()
        
        addSubview(segmentedControll)
        addSubview(imageView)
        
        setupSegmentedControllConstraints()
        setupImageViewConstraints()
    }
    
    func setupSegmentedControll() {
        segmentedControll.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }
    
    @objc func selectedValue() {
        let segmentedIndex = segmentedControll.selectedSegmentIndex // получение индекса выбранного сегмента
        imageView.image = imageArray[segmentedIndex] // установка изображения по полученному индексу
        
        let data = segmentedControll.titleForSegment(at: segmentedIndex) // получение данных, выбранных пользователем
        print(data ?? "")
    }
    
    func setupImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.black.cgColor
    }
    
    func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerY = imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let centerX = imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = imageView.widthAnchor.constraint(equalToConstant: 300)
        let height = imageView.heightAnchor.constraint(equalToConstant: 300)
        
        NSLayoutConstraint.activate([centerX, centerY, width, height])
    }
    
    func setupSegmentedControllConstraints() {
        segmentedControll.translatesAutoresizingMaskIntoConstraints = false
        
        let top = segmentedControll.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16)
        let centerX = segmentedControll.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = segmentedControll.widthAnchor.constraint(equalToConstant: 200)
        let height = segmentedControll.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([centerX, top, width, height])
    }

}
