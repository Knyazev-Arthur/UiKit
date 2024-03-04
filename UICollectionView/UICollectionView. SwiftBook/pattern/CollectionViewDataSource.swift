import UIKit

// MARK: CollectionViewDataSourceProtocol
protocol CollectionViewDataSourceProtocol {
    var galleryCollectionView: GalleryCollectionView? { get set }
}

// Когда мы подписываем свой класс под NSObject - он уже реализует некоторые методы асмостоятельно (под капотом), в связи с чем количество обязательных методов, которые нам нужно реализовать самостоятельно, уменьшается.
class CollectionViewDataSource: NSObject, UICollectionViewDataSource, CollectionViewDataSourceProtocol {
    
    // источник данных не должен владеть представлением, которое он обслуживает, в связи с чем используем слабую сслыку
    weak var galleryCollectionView: GalleryCollectionView?
    
    // метод возвращает кол-во ячеек в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        galleryCollectionView?.cells.count ?? 0
    }
    
    // метод, возвращающий настроенную ячейку
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        cell.mainImageView.image = galleryCollectionView?.cells[indexPath.row].mailnImage
        return cell
    }
    
}
