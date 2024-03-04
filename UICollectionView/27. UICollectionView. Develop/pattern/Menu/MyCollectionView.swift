import UIKit

// MARK: MyCollectionViewProtocol
protocol MyCollectionViewProtocol: UICollectionView {
    var itemMenuArray: [Menu] { get set }
    var collectionViewDelegate: CollectionViewDelegate { get set }
}

class MyCollectionView: UICollectionView, MyCollectionViewProtocol {
    
    var itemMenuArray = [Menu]()
    private let collectionViewDatasource = CollectionViewDataSource()
    private let layout = UICollectionViewFlowLayout()
    var collectionViewDelegate = CollectionViewDelegate()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension MyCollectionView {
    
    func setupCollectionView() {
        backgroundColor = .cyan
        register(CollectionViewCell.self, forCellWithReuseIdentifier: "\(CollectionViewCell.self)")
        dataSource = collectionViewDatasource
        collectionViewDatasource.myCollectionView = self
        itemMenuArray.append(.init(name: "Coca-cola", nameImage: "cola"))
        itemMenuArray.append(.init(name: "Coffe", nameImage: "coffe"))
        
        layout.minimumInteritemSpacing = 45 // расстояние между ячейками по горизонтали
        layout.minimumLineSpacing = 45 // расстояние между ячейками по вертикали
    }
    
}
