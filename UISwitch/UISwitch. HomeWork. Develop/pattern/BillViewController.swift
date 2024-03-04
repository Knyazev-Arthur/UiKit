import UIKit

class BillViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        setupUserView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension BillViewController {

    func setupUserView() {
        title = "Чек"
        view.backgroundColor = .white
    }
}
