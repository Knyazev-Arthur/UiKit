import UIKit

// MARK: CollectionViewCellProtocol
protocol CollectionViewCellProtocol {
    var imageView: UIImageView { get set }
    var label: UILabel { get set }
}

class CollectionViewCell: UICollectionViewCell, CollectionViewCellProtocol {
    
    var imageView = UIImageView()
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CollectionViewCell {
    
    func setupCollectionViewCell() {
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
        
        let top = imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        let left = imageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16)
        let height = imageView.heightAnchor.constraint(equalToConstant: 170)
        let width = imageView.widthAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, left, width, height])
    }
    
    func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let top = label.topAnchor.constraint(equalTo: imageView.bottomAnchor)
        let left = label.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16)
        let height = label.heightAnchor.constraint(equalToConstant: 20)
        let width = label.widthAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, left, width, height])
    }
    
}
