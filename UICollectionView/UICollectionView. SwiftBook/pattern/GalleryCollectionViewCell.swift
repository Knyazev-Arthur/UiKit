import UIKit

// MARK: GalleryCollectionViewCellProtocol
protocol GalleryCollectionViewCellProtocol {
    var mainImageView: UIImageView { get set }
}

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    var mainImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGalleryCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension GalleryCollectionViewCell {
    
    func setupGalleryCell() {
        mainImageView.backgroundColor = .red
        mainImageView.contentMode = .scaleAspectFit
        addSubview(mainImageView)
        setupMainImageViewConstraints()
    }
    
    func setupMainImageViewConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = mainImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        let leading = mainImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        let trailing = mainImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        let bottom = mainImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([top, trailing, leading, bottom])
    }

}
