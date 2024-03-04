import UIKit

// MARK: PageControllerProtocol
protocol PageControllerProtocol: UIViewController {
    var pageView: PageViewProtocol { get set }
}

class PageController: UIViewController, PageControllerProtocol  {
    
    var pageView: PageViewProtocol
    
    init() {
        pageView = PageView()
        super.init(nibName: nil, bundle: nil)
        pageView.delegatePageController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = pageView
    }

}
