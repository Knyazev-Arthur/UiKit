import UIKit

class CollectionViewDragDelegate: NSObject, CollectionViewDragDelegateProtocol {
    
    weak var userProfileView: UserProfileView?
    
    // метод реоизация которого необходима для выполнения главного назанчения CollectionViewDragDelegate - зацепка элемента
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        let photo = userProfileView?.source[indexPath.section].photos[indexPath.item] // инициализация перетаскиваемой ячейки
        
        let itemProvider = NSItemProvider(object: photo!) // реализация itemProvider
        
        let dragItem = UIDragItem(itemProvider: itemProvider) // itemProvider - механизм системы для определения перемещаемого элемента
        return [dragItem]
    }
    
    // метод отвечающий за сессию переноса и срабатывающий перед ее началом
    func collectionView(_ collectionView: UICollectionView, dragSessionWillBegin session: UIDragSession) {
        UIView.animate(withDuration: 0.5) {
            self.userProfileView?.buttonAlphaFalse()
        }
    }
    
    // метод срабатывающий после сессии переноса
    func collectionView(_ collectionView: UICollectionView, dragSessionDidEnd session: UIDragSession) {
        UIView.animate(withDuration: 0.5) {
            self.userProfileView?.buttonAlphaTrue()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        
        let photo = userProfileView?.source[indexPath.section].photos[indexPath.item] // инициализация перетаскиваемой ячейки
        
        let itemProvider = NSItemProvider(object: photo!) // реализация itemProvider
        
        let dragItem = UIDragItem(itemProvider: itemProvider) // itemProvider - механизм системы для определения перемещаемого элемента
        return [dragItem]
    }
    
}

// MARK: - CollectionViewDragDelegateProtocol
protocol CollectionViewDragDelegateProtocol: UICollectionViewDragDelegate {
    var userProfileView: UserProfileView? { get set }
}
