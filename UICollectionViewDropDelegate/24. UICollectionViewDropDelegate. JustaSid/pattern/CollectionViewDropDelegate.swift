import UIKit

class CollectionViewDropDelegate: NSObject, CollectionViewDropDelegateProtocol {
    
    weak var userProfileView: UserProfileView?
    
    //
    /* метод вызывается при обновлении сессии перетаскивания в коллекции. Он позволяет настраивать поведение перетаскивания, возвращая настройку для обновления коллекции во время сессии перетаскивания */
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        
        guard let _ = destinationIndexPath else { // если не определен пункт назначения destinationIndexPath
            return .init(operation: .forbidden) // перетаскивание запрещено
        }
        
        return .init(operation: .move, intent: .insertAtDestinationIndexPath) // разрешаем перемещение и указываем на вставку элемента в пункт назначения
    }
    
    
    //
    /* обязательный метод для обработки фактического действия перетаскивания в коллекции. Он передает информацию о том, что было перетащено и куда, через объект UICollectionViewDropCoordinator, содержащий информацию о перетаскиваемом объекте и ориентирующий действия при перетаскивании. Метод необходим для реализации действий, которые нужно предпринять при фактическом завершении перетаскивания. */
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator:
        UICollectionViewDropCoordinator) { // coordinator - содержит информацию о том, как будет перемещаться объект
        
        guard let destinationIndexPath = coordinator.destinationIndexPath else { return } //
        /* destinationIndexPath - это опциональный IndexPath, который представляет индекс, куда может быть перемещен или вставлен перетаскиваемый элемент в коллекцию (UICollectionView) во время сессии перетаскивания */
        
        for item in coordinator.items { // элементы в coordinator.items представляют перетаскиваемые элементы
            guard let photo = item.dragItem.localObject as? Photo else { continue } // является ли dragItem (перетаскиваемый элемент) объектом типа Photo
            guard let sourceIndexPath = item.sourceIndexPath else { continue } // проверяется наличие исходного индекса перетаскиваемого элемента (sourceIndexPath) у элемент
            
            collectionView.performBatchUpdates({ // выполняется анимация обновления коллекции в блоке обновлений
                move(photo: photo, to: destinationIndexPath) // метод для перемещения элемента в коллекции
                collectionView.moveItem(at: sourceIndexPath, to: destinationIndexPath) //
                /* перемещаем элемент с позиции sourceIndexPath на позицию destinationIndexPath. Метод отвечает за фактическое анимированное перемещение элемента в интерфейсе коллекции. */
            }, completion: { _ in
            })
        }
        
        for item in coordinator.items {
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath) //
            /* для каждого элемента вызывается метод coordinator.drop, который указывает на завершение операции перетаскивания элемента к указанному destinationIndexPath */
        }
    }
    
    // метод принимает фотографию (photo) для перемещения и целевой индекс в коллекции (indexPath), куда нужно переместить фотографию
    private func move(photo: Photo, to indexPath: IndexPath) {
        var newPhotos = [Photo]()
        var sections = [SectionPhoto]()
        
        if let userProfileView = userProfileView {
        for section in userProfileView.source { // перебираем разделы из источника (source) объекта userProfileView
            newPhotos = section.photos.filter{ return $0.id != photo.id } //
            /* Для каждого раздела, фильтруются фотографии (photos), исключая ту, которую нужно переместить (photo.id != $0.id). Оставшиеся фотографии сохраняются в newPhotos */
            sections.append(.init(sectionName: section.sectionName, photos: newPhotos)) // создается новый раздел (SectionPhoto) с обновленным списком фотографий и добавляется в массив sections
            }
        }
        
        sections[indexPath.section].photos.insert(photo, at: indexPath.item) // вставка перемещаемой фотографии (photo) в указанный индекс (indexPath) внутри соответствующего раздела
        if let userProfileView = userProfileView {
            userProfileView.source = sections // обновляем source обновленным массивом sections
        }
    }
    
    // метод, вызываемый после окончанчания сессии переноса
    func collectionView(_ collectionView: UICollectionView, dropSessionDidEnd session: UIDropSession) {
        print(#function)
    }

}

// MARK: - CollectionViewDropDelegateProtocol
protocol CollectionViewDropDelegateProtocol: UICollectionViewDropDelegate {
    var userProfileView: UserProfileView? { get set }
}

