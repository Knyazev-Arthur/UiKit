import UIKit

class PizzaViewController: UIViewController {

    private let pizzaView: PizzaViewProtocol
    
    init() {
        pizzaView = PizzaView()
        super.init(nibName: nil, bundle: nil)
        pizzaView.pizzaViewControllerDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = pizzaView
    }

}
