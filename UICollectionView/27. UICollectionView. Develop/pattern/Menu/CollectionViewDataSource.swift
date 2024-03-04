import UIKit

// MARK: CollectionViewDataSourceProtocol
protocol CollectionViewDataSourceProtocol {
    var myCollectionView: MyCollectionViewProtocol? { get set }
}

class CollectionViewDataSource: NSObject, UICollectionViewDataSource, CollectionViewDataSourceProtocol {
    
    weak var myCollectionView: MyCollectionViewProtocol?
    
    // метод устанавливающий кол-во ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        myCollectionView?.itemMenuArray.count ?? 0
    }
    
    // метод устанавливающий вид ячейки, какие данные мы ей передаем для отображения
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCell.self)", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        itemCell.imageView.image = UIImage(named: myCollectionView?.itemMenuArray[indexPath.row].nameImage ?? "")
        itemCell.label.text = myCollectionView?.itemMenuArray[indexPath.row].name
        return itemCell
    }
    

}
