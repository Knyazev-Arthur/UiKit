import UIKit

class UserProfileView: UIView, UserProfileViewProtocol {

    var collectionViewDataSource: CollectionViewDataSourceProtocol // для управление источником данных коллекции
    var layout: UICollectionViewFlowLayout
    
    let source: [SectionPhoto] = [
        SectionPhoto(sectionName: "first Section", photos: Source.randomPhotos(with: 15)),
        SectionPhoto(sectionName: "second Section", photos: Source.randomPhotos(with: 15))
    ]
    
    private var collectionView: UICollectionView
    private let button: UIButton

    init() {
        self.layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        self.collectionViewDataSource = CollectionViewDataSource()
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
        
        collectionView.dataSource = collectionViewDataSource // установка источника данных для collectionView
        collectionViewDataSource.userProfileView = self // присвоение ссылки на текущий объект в качестве представления профиля источнику данных коллекции
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "\(PhotoCell.self)") // регистрация ячейки коллекции для использования с идентификатором
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HeaderReusableView.self)")
        collectionView.backgroundColor = .lightGray
    }
    // метод для настройки размеров ячеек
    func setupFlowLayout(){
        let cellWidth = (UIScreen.main.bounds.width - 90) / 2 // вычисление ширины ячейки, зависящей от ширины экрана
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth) // установка размеров элемента в макете
        layout.minimumLineSpacing = 10 // установка минимального расстояния между строками элементов в макете
        layout.minimumInteritemSpacing = 10 // установка минимального интервала между элементами в макете
        layout.sectionInset = .init(top: 30, left: 30, bottom: 30, right: 30) // установка внутренних отступов для секций в макете
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
        // проверяется текущее направление прокрутки у макета коллекции
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
}
