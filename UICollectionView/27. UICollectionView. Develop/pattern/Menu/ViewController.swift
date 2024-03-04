import UIKit

class ViewController: UIViewController {
    
    private let myCollectionView = MyCollectionView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        myCollectionView.collectionViewDelegate.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = myCollectionView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "\(DetailController.self)" {
            if let vc = segue.destination as? DetailController {
                let menu = sender as? Menu
                vc.detailView.menu = menu
            }
        }
    }

}
