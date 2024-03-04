import UIKit

// MARK: IngredientViewControllerProtocol
protocol IngredientViewControllerProtocol: UIViewController {
    var ingredientView: IngredientViewProtocol { get set }
}

class IngredientViewController: UIViewController, IngredientViewControllerProtocol {

    var ingredientView: IngredientViewProtocol
    
    init() {
        ingredientView = IngredientView()
        super.init(nibName: nil, bundle: nil)
        ingredientView.ingredientViewControllerDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = ingredientView
    }
}
