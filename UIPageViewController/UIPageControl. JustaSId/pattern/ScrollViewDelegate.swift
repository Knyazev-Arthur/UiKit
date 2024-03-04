import UIKit

class ScrollViewDelegate: NSObject, ScrollViewDelegateProtocol {
    weak var userProfile: UserProfileView?
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let point = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
        userProfile?.setupCurrentPageScrollView(point)
    }
}

// MARK: ScrolViewDelegateProtocol
protocol ScrollViewDelegateProtocol: UIScrollViewDelegate {
    var userProfile: UserProfileView? { get set }
}
