import UIKit

// MARK: - PizzaViewProtocol
protocol IngredientViewProtocol: UIView {
    var ingredientViewControllerDelegate: IngredientViewController? { get set }
    var pizza: String { get set }
}

class IngredientView: UIView, IngredientViewProtocol {
    
    weak var ingredientViewControllerDelegate: IngredientViewController?
    var pizza: String = "" {
        didSet {
            setupIngredientView()
        }
    }
    private let namePizzaLabel: UILabel
    private let pizzaImage: UIImageView
    private let cheeseStack: UIStackView
    private let hamStack: UIStackView
    private let mushroomStack: UIStackView
    private let oliveStack: UIStackView
    private let selectButton: UIButton
    private let cheeseSwitch: UISwitch
    private let hamSwitch: UISwitch
    private let mushroomSwitch: UISwitch
    private let oliveSwitch: UISwitch
    
    init() {
        self.namePizzaLabel = UILabel()
        self.pizzaImage = UIImageView()
        self.cheeseStack = UIStackView()
        self.hamStack = UIStackView()
        self.mushroomStack = UIStackView()
        self.oliveStack = UIStackView()
        self.selectButton = UIButton()
        self.cheeseSwitch = UISwitch()
        self.hamSwitch = UISwitch()
        self.mushroomSwitch = UISwitch()
        self.oliveSwitch = UISwitch()
        
        super.init(frame: .zero)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        ingredientViewControllerDelegate?.title = "Ингридиенты"
    }
}

private extension IngredientView {
    
    func setupIngredientView() {
        backgroundColor = .white
        
        setupNamePizzaLabel()
        setupPizzaImage()
        setupCheeseStack()
        setupHamStack()
        setupMushroomStack()
        setupOliveStack()
        setupSelectButton()
        
        addSubview(namePizzaLabel)
        addSubview(pizzaImage)
        addSubview(cheeseStack)
        addSubview(hamStack)
        addSubview(mushroomStack)
        addSubview(oliveStack)
        addSubview(selectButton)
        
        setupNamePizzaLabelConstraints()
        setupPizzaImageConstraints()
        setupCheeseStackConstraints()
        setupHamStackConstraints()
        setupMushroomStackConstraints()
        setupOliveStackConstraints()
        setupSelectButtonConstraints()
    }
    
    func setupNamePizzaLabel() {
        namePizzaLabel.font = UIFont.boldSystemFont(ofSize: 30)
        namePizzaLabel.textColor = .systemBlue
        namePizzaLabel.textAlignment = .center
        namePizzaLabel.text = pizza
    }
    
    func setupPizzaImage() {
        pizzaImage.image = UIImage(named: pizza)
    }
    
    func setupCheeseStack() {
        let cheeseLabel = UILabel()
        cheeseLabel.text = "Сыр"
        cheeseLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        cheeseStack.spacing = 8
        cheeseStack.addArrangedSubview(cheeseLabel)
        cheeseStack.addArrangedSubview(cheeseSwitch)
    }
    
    func setupHamStack() {
        let hamLabel = UILabel()
        hamLabel.text = "Ветчина"
        hamLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        hamStack.spacing = 10
        hamStack.addArrangedSubview(hamLabel)
        hamStack.addArrangedSubview(hamSwitch)
    }
    
    func setupMushroomStack() {
        let mushroomLabel = UILabel()
        mushroomLabel.text = "Грибы"
        mushroomLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        mushroomStack.spacing = 10
        mushroomStack.addArrangedSubview(mushroomLabel)
        mushroomStack.addArrangedSubview(mushroomSwitch)
    }
    
    func setupOliveStack() {
        let oliveLabel = UILabel()
        oliveLabel.text = "Маслины"
        oliveLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        oliveStack.spacing = 10
        oliveStack.addArrangedSubview(oliveLabel)
        oliveStack.addArrangedSubview(oliveSwitch)
    }
    
    func setupSelectButton() {
        selectButton.setTitleColor(.systemBlue, for: .normal)
        selectButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        selectButton.layer.borderColor = UIColor.black.cgColor
        selectButton.layer.borderWidth = 2
        selectButton.layer.cornerRadius = 5
        selectButton.setTitle("Выбрать", for: .normal)
        selectButton.addTarget(self, action: #selector(tapSelectButton), for: .touchUpInside)
    }
    
    @objc func tapSelectButton() {
        selectButton.setupTapButton()
        let controller = OrderViewController()
        ingredientViewControllerDelegate?.navigationController?.pushViewController(controller, animated: true)
        controller.orderView.order = textOrder()
    }
    
    func setupNamePizzaLabelConstraints() {
        namePizzaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = namePizzaLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leading = namePizzaLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35)
        let trailing = namePizzaLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -35)
        let height = namePizzaLabel.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupPizzaImageConstraints() {
        pizzaImage.translatesAutoresizingMaskIntoConstraints = false
        
        let top = pizzaImage.topAnchor.constraint(equalTo: namePizzaLabel.bottomAnchor, constant: 16)
        let centerX = pizzaImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let height = pizzaImage.heightAnchor.constraint(equalToConstant: 200)
        let width = pizzaImage.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([top, centerX, width, height])
    }
    
    func setupCheeseStackConstraints() {
        cheeseStack.translatesAutoresizingMaskIntoConstraints = false
        
        let top = cheeseStack.topAnchor.constraint(equalTo: pizzaImage.bottomAnchor, constant: 16)
        let leading = cheeseStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35)
        let trailing = cheeseStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -35)
        let height = cheeseStack.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupHamStackConstraints() {
        hamStack.translatesAutoresizingMaskIntoConstraints = false
        
        let top = hamStack.topAnchor.constraint(equalTo: cheeseStack.bottomAnchor, constant: 16)
        let leading = hamStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35)
        let trailing = hamStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -35)
        let height = hamStack.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupMushroomStackConstraints() {
        mushroomStack.translatesAutoresizingMaskIntoConstraints = false
        
        let top = mushroomStack.topAnchor.constraint(equalTo: hamStack.bottomAnchor, constant: 16)
        let leading = mushroomStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35)
        let trailing = mushroomStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -35)
        let height = mushroomStack.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupOliveStackConstraints() {
        oliveStack.translatesAutoresizingMaskIntoConstraints = false
        
        let top = oliveStack.topAnchor.constraint(equalTo: mushroomStack.bottomAnchor, constant: 16)
        let leading = oliveStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35)
        let trailing = oliveStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -35)
        let height = oliveStack.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupSelectButtonConstraints() {
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = selectButton.topAnchor.constraint(equalTo: oliveStack.bottomAnchor, constant: 30)
        let centerX = selectButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let height = selectButton.heightAnchor.constraint(equalToConstant: 40)
        let width = selectButton.widthAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, centerX, width, height])
    }
    
    func textOrder() -> String {
        var order = "Ваш заказ: \(pizza)"
        if cheeseSwitch.isOn {
            order += "\n- Сыр"
        }
        if hamSwitch.isOn {
            order += "\n- Ветчина"
        }
        if mushroomSwitch.isOn {
            order += "\n- Грибы"
        }
        if oliveSwitch.isOn {
            order += "\n- Маслины"
        }
        return order
    }
    
}
