import UIKit

class ViewController: UIViewController {
    
    private let customView: CustomView
    
    init() {
        self.customView = CustomView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }

}
