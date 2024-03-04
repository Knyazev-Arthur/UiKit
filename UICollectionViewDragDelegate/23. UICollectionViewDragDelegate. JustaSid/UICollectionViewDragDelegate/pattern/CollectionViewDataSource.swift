import UIKit

class CollectionViewDataSource: NSObject, CollectionViewDataSourceProtocol {

    weak var userProfileView: UserProfileView? // слабая ссылка на объект UserProfileView используется для получения данных, необходимых для отображения коллекции
    // метод возвращает количество секций в коллекции
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        userProfileView?.source.count ?? 0 // количество разделов в source
    }
    // метод возвращает количество элементов в каждой секции коллекции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userProfileView?.source[section].photos.count ?? 0 // количество фотографий в каждом разделе, хранящемся в объекте source
    }
    // метод возвращает и настраивает отдельную ячейку коллекции для определенного индекса
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoCell.self)", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = UIImage(named: userProfileView?.source[indexPath.section].photos[indexPath.item].imageName ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionView.elementKindSectionHeader: // elementKindSectionHeader - константа, которая определяет тип элемента, который можно добавить в коллекцию как дополнительный элемент для секции
            
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(HeaderReusableView.self)", for: indexPath) as? HeaderReusableView else {
                return UICollectionReusableView()
            }
            
            let text = userProfileView?.source[indexPath.section].sectionName ?? ""
            view.setupText(text)
            return view
            
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - TextViewDelegateProtocol
protocol CollectionViewDataSourceProtocol: UICollectionViewDataSource {
    var userProfileView: UserProfileView? { get set }
}
