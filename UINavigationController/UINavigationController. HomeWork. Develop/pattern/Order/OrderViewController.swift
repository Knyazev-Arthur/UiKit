import UIKit

// MARK: IngredientViewControllerProtocol
protocol OrderViewControllerProtocol: UIViewController {
    var orderView: OrderViewProtocol { get set }
}

class OrderViewController: UIViewController, OrderViewControllerProtocol {

    var orderView: OrderViewProtocol
    
    init() {
        orderView = OrderView()
        super.init(nibName: nil, bundle: nil)
        orderView.orderViewControllerDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = orderView
    }
}
