import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var customView: CustomView?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("numberOfItemsInSection")
        return customView?.albumCovers.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AlbumCoverCell.self)", for: indexPath) as? AlbumCoverCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = UIImage(named: customView?.albumCovers[indexPath.item] ?? "")
        print("cellForItemAt")
        return cell
    }
    
}
