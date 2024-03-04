import UIKit

class CollectionViewDelegate: NSObject, CollectionViewDelegateProtocol {
    
    weak var userProfileView: UserProfileView?
    weak var viewController: ViewController?

//    // метод для подсвечивания конкретной ячейки
//    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        true
//    }
//    // метод, вызываемый во время подсвечивания
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.contentView.backgroundColor = .red
//    }
//    // метод, вызываемый после окончания подсвечивания
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.contentView.backgroundColor = .clear
//    }
    
    // метод уточняющий необходимость выделения элемента
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "select", message: "section \(indexPath.section), item \(indexPath.item)", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        viewController?.present(alertController, animated: true)
    }
    
    // метод, срабатывающий после нажатия alertController
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("section \(indexPath.section), item \(indexPath.item)")
    }
    
    // метод срабатывабщий после отображения всех ячеек
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastSection = userProfileView!.source.count - 1
        let lastItem = userProfileView!.source[lastSection].photos.count - 1
        
        let lastIndexPath = IndexPath(item: lastItem, section: lastSection)
        
        if indexPath == lastIndexPath {
            print("Chlen")
        }
    }
    
    // метод срабатывающий после того, как ячейки исчезли
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("section \(indexPath.section), item \(indexPath.item)")
    }
    
    // метод, уведомляющий о появлении хедера
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        print(" \(elementKind) повился")
    }
    // метод, уведомляющий о скрытии хедера
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        print(" \(elementKind) кончился")
    }
}

// MARK: - CollectionViewDelegateProtocol
protocol CollectionViewDelegateProtocol: UICollectionViewDelegate {
    var userProfileView: UserProfileView? { get set }
    var viewController: ViewController? { get set }
}
