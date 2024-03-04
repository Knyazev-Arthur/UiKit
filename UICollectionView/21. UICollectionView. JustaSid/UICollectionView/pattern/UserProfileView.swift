import UIKit

class UserProfileView: UIView {
    
    private var collectionView: UICollectionView
    
    init() {
        self.collectionView = UICollectionView()
        super.init(frame: .zero)
        setupUserProfile()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserProfile() {
        addSubview(collectionView)
        
        setupCollectionViewConstraint()
        
        setupCollectionView()
    }
    
    private func setupCollectionViewConstraint() {
        
        let top = collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        let bottom = collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        let leading = collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
        let trailing = collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        
        NSLayoutConstraint.activate([top,bottom,leading,trailing])
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        return layout
    }
}

