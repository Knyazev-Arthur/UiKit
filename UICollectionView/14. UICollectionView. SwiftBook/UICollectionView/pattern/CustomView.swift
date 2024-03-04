import UIKit

class CustomView: UIView {
    
    var albumCovers = ["Alberto Ruiz - 7 Elements (Original Mix)",
                       "Dave Wincent - Red Eye (Original Mix)",
                       "E-Spectro - End Station (Original Mix)",
                       "Edna Ann - Phasma (Konstantin Yoodza Remix)",
                       "Ilija Djokovic - Delusion (Original Mix)",
                       "John Baptiste - Mycelium (Original Mix)",
                       "Lane 8 - Fingerprint (Original Mix)",
                       "Mac Vaughn - Pink Is My Favorite Color (Alex Stein Remix)",
                       "Metodi Hristov, Gallya - Badmash (Original Mix)",
                       "Veerus, Maxie Devine - Nightmare (Original Mix)"]
    
    private var collectionView: UICollectionView
    private var layout: UICollectionViewFlowLayout
    private let collectionViewDataSource: CollectionViewDataSource
    
    init() {
        self.layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        self.collectionViewDataSource = CollectionViewDataSource()
        
        super.init(frame: .zero)
        setupCustomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCustomView() {
        backgroundColor = .white
        setupCollectionView()
        setupLayout()
        
        addSubview(collectionView)
        setupCollectionViewConstraints()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = collectionViewDataSource
        collectionViewDataSource.customView = self
        collectionView.register(AlbumCoverCell.self, forCellWithReuseIdentifier: "\(AlbumCoverCell.self)")
        collectionView.backgroundColor = .white
    }
    
    private func setupLayout() {
        let cellWidth = (UIScreen.main.bounds.width - 90) / 2
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 30, left: 30, bottom: 30, right: 30)
        layout.headerReferenceSize = .init(width: self.frame.size.width, height: 60)
        layout.scrollDirection = .vertical
    }
    
    private func setupCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        let top = collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        let leading = collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
        let trailing = collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        let bottom = collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([top,leading,trailing,bottom])
    }
    
}
