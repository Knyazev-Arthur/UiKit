import UIKit

// MARK: GalleryCollectionViewProtocol
protocol GalleryCollectionViewProtocol: UICollectionView {
    var cells: [SushiModel] { get set }
    func set(cells: [SushiModel])
}

class GalleryCollectionView: UICollectionView, GalleryCollectionViewProtocol {
    
    var cells = [SushiModel]()
    private let layout = UICollectionViewFlowLayout()
    private let collectionDataSource = CollectionViewDataSource()
    private let collectionViewDelegate = CollectionViewDelegate()
    
    // по умолчанию в файле ViewDidLoad не должны задаваться параметры frame и layout для GalleryCollection
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        setupGalleryView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cells: [SushiModel]) {
        self.cells = cells
    }

}

private extension GalleryCollectionView {
    
    func setupGalleryView() {
        backgroundColor = .green
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
        dataSource = collectionDataSource
        collectionDataSource.galleryCollectionView = self
        delegate = collectionViewDelegate
        
        layout.scrollDirection = .horizontal // движение ячеек по горизонтали
        layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing // расстояние между ячейками
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView) // устанавливаем расстояние ячеек до краев
    }
    
}
