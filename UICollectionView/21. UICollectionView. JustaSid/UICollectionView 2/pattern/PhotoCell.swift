import UIKit

class PhotoCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.addSubview(imageView)
        setupImageViewConstraint()
        setupImageView()
    }
    
    private func setupImageViewConstraint() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let trailing = imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let top = imageView.topAnchor.constraint(equalTo: contentView.topAnchor)
        let bottom = imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        NSLayoutConstraint.activate([leading,trailing,top,bottom])
    }
    
    private func setupImageView() {
        imageView.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
}
