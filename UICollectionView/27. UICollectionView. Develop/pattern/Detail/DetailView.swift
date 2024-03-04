import UIKit

class DetailView: UIView {
    
    var menu: Menu?
    
    private var imageView = UIImageView() {
        didSet {
            imageView.image = UIImage(named: menu?.nameImage ?? "")
        }
    }
    private var label = UILabel() {
        didSet {
            label.text = menu?.name
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupDetailView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension DetailView {
    
    func setupDetailView() {
        backgroundColor = .cyan
        setupImageView()
        setupLabel()
        addSubview(imageView)
        addSubview(label)
        setupImageViewConstraints()
        setupLabelConstraints()
    }
    
    func setupImageView() {
        imageView.contentMode = .scaleAspectFit
    }
    
    func setupLabel() {
        label.textAlignment = .center
        label.backgroundColor = .red
        label.textColor = .white
    }
    
    func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50)
        let centerX = imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        let height = imageView.heightAnchor.constraint(equalToConstant: 270)
        let width = imageView.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([top, centerX, width, height])
    }
    
    func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let top = label.topAnchor.constraint(equalTo: imageView.bottomAnchor)
        let centerX = label.centerXAnchor.constraint(equalTo: centerXAnchor)
        let height = label.heightAnchor.constraint(equalToConstant: 40)
        let width = label.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([top, centerX, width, height])
    }
    
}
