import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    private var galleryCollectionView = GalleryCollectionView()

    init() {
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension UserProfileView {
    
    func setupUserProfileView() {
        addSubview(galleryCollectionView)
        setupGalleryCollectionViewConstraints()
        galleryCollectionView.set(cells: SushiModel.fetchSushi())
    }
    
    func setupGalleryCollectionViewConstraints() {
        galleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = galleryCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100)
        let leading = galleryCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        let trailing = galleryCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        let height = galleryCollectionView.heightAnchor.constraint(equalToConstant: 350)
        
        NSLayoutConstraint.activate([top, trailing, leading, height])
    }
    
}
