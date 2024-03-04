import UIKit

// MARK: DelegateScrollViewProtocol
protocol DelegateScrollViewProtocol: UIScrollViewDelegate {
    var userScrollView: UserScrollViewProtocol? { get set }
}

class DelegateScrollView: NSObject, DelegateScrollViewProtocol {
    
    weak var userScrollView: UserScrollViewProtocol?
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("Начинается прокрутка")
//        print("\(scrollView.contentOffset.y)")
//        userScrollView?.alpha = 0.50
//    }
//    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print("Прокрутка закончилась")
//        userScrollView?.alpha = 1
//    }
//    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        print("Гарантирую вернуть alpha к 1")
//        userScrollView?.alpha = 1
//    }
}
