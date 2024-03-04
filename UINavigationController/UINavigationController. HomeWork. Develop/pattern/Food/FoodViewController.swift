import UIKit

class FoodViewController: UIViewController {

    private let foodView: FoodViewProtocol
    
    init() {
        foodView = FoodView()
        super.init(nibName: nil, bundle: nil)
        foodView.foodViewControllerDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = foodView
    }

}
