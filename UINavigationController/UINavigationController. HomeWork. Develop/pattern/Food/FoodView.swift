import UIKit

// MARK: - FoodViewProtocol
protocol FoodViewProtocol: UIView {
    var foodViewControllerDelegate: FoodViewController? { get set }
}

class FoodView: UIView, FoodViewProtocol {
    
    weak var foodViewControllerDelegate: FoodViewController?
    private let pizzaButton: UIButton
    private let sushiButton: UIButton
    
    init() {
        self.pizzaButton = UIButton()
        self.sushiButton = UIButton()
        super.init(frame: .zero)
        setupFoodView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        foodViewControllerDelegate?.title = "Food"
        foodViewControllerDelegate?.navigationItem.hidesBackButton = true
    }

}

private extension FoodView {
        
    func setupFoodView() {
        backgroundColor = .white
        
        setupPizzaButton()
        setupSushiButton()
        
        addSubview(pizzaButton)
        addSubview(sushiButton)
        
        setupPizzaButtonConstraints()
        setupSushiButtonConstraints()
    }
    
    func setupPizzaButton() {
        pizzaButton.setTitleColor(.systemBlue, for: .normal)
        pizzaButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        pizzaButton.layer.borderColor = UIColor.black.cgColor
        pizzaButton.layer.borderWidth = 2
        pizzaButton.layer.cornerRadius = 5
        pizzaButton.setTitle("Пицца", for: .normal)
        pizzaButton.addTarget(self, action: #selector(tapPizzaButton), for: .touchUpInside)
    }
    
    @objc func tapPizzaButton() {
        pizzaButton.setupTapButton()
        let controller = PizzaViewController()
        foodViewControllerDelegate?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func setupSushiButton() {
        sushiButton.setTitleColor(.systemBlue, for: .normal)
        sushiButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        sushiButton.layer.borderColor = UIColor.black.cgColor
        sushiButton.layer.borderWidth = 2
        sushiButton.layer.cornerRadius = 5
        sushiButton.setTitle("Суши", for: .normal)
        sushiButton.addTarget(self, action: #selector(tapSushiButton), for: .touchUpInside)
    }
    
        @objc func tapSushiButton() {
            sushiButton.setupTapButton()
        }
    
    func setupPizzaButtonConstraints() {
        pizzaButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = pizzaButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50)
        let centerX = pizzaButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let trailing = pizzaButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -35)
        let leading = pizzaButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35)

        NSLayoutConstraint.activate([top, centerX, trailing, leading])
    }
    
    func setupSushiButtonConstraints() {
        sushiButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = sushiButton.topAnchor.constraint(equalTo: pizzaButton.bottomAnchor, constant: 20)
        let centerX = sushiButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let trailing = sushiButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -35)
        let leading = sushiButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35)

        NSLayoutConstraint.activate([top, centerX, trailing, leading])
    }
}
