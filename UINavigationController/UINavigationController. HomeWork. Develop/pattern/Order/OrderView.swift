import UIKit

// MARK: - PizzaViewProtocol
protocol OrderViewProtocol: UIView {
    var orderViewControllerDelegate: OrderViewControllerProtocol? { get set }
    var order: String { get set }
}

class OrderView: UIView, OrderViewProtocol {
    
    weak var orderViewControllerDelegate: OrderViewControllerProtocol?
    var order: String = "" {
        didSet {
            setupIngredientView()
        }
    }
    private let orderLabel: UILabel
    private let cashSwitch: UISwitch
    private let cashStack: UIStackView
    private let cardSwitch: UISwitch
    private let cardStack: UIStackView
    private let orderButton: UIButton
    
    init() {
        self.orderLabel = UILabel()
        self.cashSwitch = UISwitch()
        self.cashStack = UIStackView()
        self.cardSwitch = UISwitch()
        self.cardStack = UIStackView()
        self.orderButton = UIButton()
 
        super.init(frame: .zero)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        orderViewControllerDelegate?.title = "Оплата"
    }
}

private extension OrderView {
    
    func setupIngredientView() {
        backgroundColor = .white
        
        setupOrderLabel()
        setupCashStack()
        setupCardStack()
        setuporderButton()
        
        addSubview(orderLabel)
        addSubview(cashStack)
        addSubview(cardStack)
        addSubview(orderButton)
        
        setupOrderLabelConstraints()
        setupCashStackConstraints()
        setupCardStackConstraints()
        setupOrderButtonConstraints()
    }
    
    func setupOrderLabel() {
        orderLabel.text = order
        orderLabel.font = UIFont.boldSystemFont(ofSize: 30)
        orderLabel.numberOfLines = 0
    }
    
    func setupCashStack() {
        let cashLabel = UILabel()
        cashLabel.text = "Оплата наличными"
        cashLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        cashStack.spacing = 10
        cashStack.addArrangedSubview(cashLabel)
        cashStack.addArrangedSubview(cashSwitch)
    }
    
    func setupCardStack() {
        let cardLabel = UILabel()
        cardLabel.text = "Оплата картой"
        cardLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        cardStack.spacing = 10
        cardStack.addArrangedSubview(cardLabel)
        cardStack.addArrangedSubview(cardSwitch)
    }
    
    func setuporderButton() {
        orderButton.setTitleColor(.systemBlue, for: .normal)
        orderButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        orderButton.layer.borderColor = UIColor.black.cgColor
        orderButton.layer.borderWidth = 2
        orderButton.layer.cornerRadius = 5
        orderButton.setTitle("Оплатить", for: .normal)
        orderButton.addTarget(self, action: #selector(tapSelectButton), for: .touchUpInside)
    }
    
    @objc func tapSelectButton() {
        orderButton.setupTapButton()
        showAlert()
    }
    
    func setupOrderLabelConstraints() {
        orderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = orderLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leading = orderLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailing = orderLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let height = orderLabel.heightAnchor.constraint(equalToConstant: 300)
        
        NSLayoutConstraint.activate([top, leading, height, trailing])
    }
    
    func setupCashStackConstraints() {
        cashStack.translatesAutoresizingMaskIntoConstraints = false
        
        let top = cashStack.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 100)
        let leading = cashStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35)
        let trailing = cashStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -35)
        let height = cashStack.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([top, leading, height, trailing])
    }
    
    func setupCardStackConstraints() {
        cardStack.translatesAutoresizingMaskIntoConstraints = false
        
        let top = cardStack.topAnchor.constraint(equalTo: cashStack.bottomAnchor, constant: 16)
        let leading = cardStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35)
        let trailing = cardStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -35)
        let height = cardStack.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([top, leading, height, trailing])
    }
    
    func setupOrderButtonConstraints() {
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = orderButton.topAnchor.constraint(equalTo: cardStack.bottomAnchor, constant: 30)
        let centerX = orderButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let height = orderButton.heightAnchor.constraint(equalToConstant: 40)
        let width = orderButton.widthAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, centerX, width, height])
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Оплата успешно произведена", message: "Спасибо за ваш заказ!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { [ weak self ] _ in
            let controller = FoodViewController()
            self?.orderViewControllerDelegate?.navigationController?.pushViewController(controller, animated: true)
        }))
        orderViewControllerDelegate?.present(alert, animated: true, completion: nil)
    }
}
