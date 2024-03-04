import UIKit

class CollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private weak var galleryCollectionView: GalleryCollectionView?
    
    // метод устанавливающий размер ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.galleryItemWidth, height: galleryCollectionView?.frame.height ?? 200)
    }
    
}
