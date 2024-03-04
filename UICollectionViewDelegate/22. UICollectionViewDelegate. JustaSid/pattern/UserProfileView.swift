import UIKit

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var collectionViewDelegate: CollectionViewDelegateProtocol
    var collectionViewDataSource: CollectionViewDataSourceProtocol
    var layout: UICollectionViewFlowLayout
    
    let source: [SectionPhoto] = [
        SectionPhoto(sectionName: "first Section", photos: Source.randomPhotos(with: 16)),
        SectionPhoto(sectionName: "second Section", photos: Source.randomPhotos(with: 16))]
    
    private var collectionView: UICollectionView
    private let button: UIButton

    init() {
        self.layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        self.collectionViewDataSource = CollectionViewDataSource()
        self.collectionViewDelegate = CollectionViewDelegate()
        self.button = UIButton()
        super.init(frame: .zero)
        setupUserProfile()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UserProfileView {
    
    func setupUserProfile() {
        backgroundColor = .white
        setupCollectionView()
        setupFlowLayout()
        setupBottom()
        addSubview(collectionView)
        addSubview(button)
        
        setupCollectionViewConstraints()
        setupBottomConstraint()
    }
    
    func setupCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        let top = collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        let leading = collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
        let trailing = collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        
        NSLayoutConstraint.activate([top,leading,trailing])
    }
    
    func setupCollectionView() {
        collectionView.delegate = collectionViewDelegate
        collectionViewDelegate.userProfileView = self
        collectionView.dataSource = collectionViewDataSource
        collectionViewDataSource.userProfileView = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "\(PhotoCell.self)")
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HeaderReusableView.self)")
        collectionView.backgroundColor = .white
    }
    // метод для настройки размеров ячеек
    func setupFlowLayout(){
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.headerReferenceSize = .init(width: self.frame.size.width, height: 60)
    }
    
    func setupBottomConstraint() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let top = button.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8)
        let bottom = button.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        let leading = button.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
        let trailing = button.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        let height = button.heightAnchor.constraint(equalToConstant: 64)
        
        NSLayoutConstraint.activate([top,bottom,leading,trailing,height])
    }
    
    func setupBottom() {
        button.setTitle("Change", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        if layout.scrollDirection == .horizontal {
            layout.scrollDirection = .vertical
        } else {
            layout.scrollDirection = .horizontal
        }
        
        UIView.animate(withDuration: 1) {
            self.layoutIfNeeded()
        }
    }
}

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var collectionViewDataSource: CollectionViewDataSourceProtocol { get set }
    var collectionViewDelegate: CollectionViewDelegateProtocol { get set }
}
