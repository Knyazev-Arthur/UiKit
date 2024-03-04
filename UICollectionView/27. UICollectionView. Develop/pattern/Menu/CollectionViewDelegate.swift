import UIKit

class CollectionViewDelegate: NSObject, UICollectionViewDelegate {
    private weak var myCollectionView: MyCollectionView?
    weak var viewController: ViewController?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = myCollectionView?.itemMenuArray[indexPath.row]
        viewController?.performSegue(withIdentifier: "\(DetailController.self)", sender: menu)
    }
    
}
