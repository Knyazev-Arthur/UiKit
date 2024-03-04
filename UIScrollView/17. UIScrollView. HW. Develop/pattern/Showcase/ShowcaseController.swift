import UIKit

class ShowcaseController: UIViewController {
    
    private let showcaseView: ShowcaseViewProtocol
    
    init() {
        showcaseView = ShowcaseView()
        super.init(nibName: nil, bundle: nil)
        showcaseView.delegateShowcaseController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = showcaseView
    }

}
