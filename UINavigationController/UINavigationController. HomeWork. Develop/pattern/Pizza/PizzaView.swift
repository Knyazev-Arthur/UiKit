import UIKit

// MARK: - PizzaViewProtocol
protocol PizzaViewProtocol: UIView {
    var pizzaViewControllerDelegate: PizzaViewController? { get set }
}

class PizzaView: UIView, PizzaViewProtocol {
    
    weak var pizzaViewControllerDelegate: PizzaViewController?
    private let margaritaImage: UIImageView
    private let margaritaLabel: UILabel
    private let margaritaButton: UIButton
    private let peperoniImage: UIImageView
    private let peperoniLabel: UILabel
    private let peperoniButton: UIButton
    private let backButton: UIBarButtonItem
    
    init() {
        self.margaritaImage = UIImageView()
        self.margaritaLabel = UILabel()
        self.margaritaButton = UIButton()
        self.peperoniImage = UIImageView()
        self.peperoniLabel = UILabel()
        self.peperoniButton = UIButton()
        self.backButton = UIBarButtonItem()
        
        super.init(frame: .zero)
        setupPizzaView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        pizzaViewControllerDelegate?.title = "Pizza"
        setupBackButton()
    }
}

private extension PizzaView {
    
    func setupPizzaView() {
        backgroundColor = .white
        
        setupMargaritaImage()
        setupMargaritaLabel()
        setupMargaritaButton()
        setupPeperoniImage()
        setupPeperoniLabel()
        setupPeperoniButton()
        
        addSubview(margaritaImage)
        addSubview(margaritaLabel)
        addSubview(margaritaButton)
        addSubview(peperoniImage)
        addSubview(peperoniLabel)
        addSubview(peperoniButton)
        
        setupMargaritaImageConstraints()
        setupMargaritaLabelConstraints()
        setupMargaritaButtonConstraints()
        setupPeperoniImageConstraints()
        setupPeperoniLabelConstraints()
        setupPeperoniButtonConstraints()
    }
    
    func setupBackButton() {
        backButton.title = "" // Устанавливаем пустую строку, чтобы скрыть текст "Back"
        backButton.target = self
        backButton.action = #selector(backButtonTapped)
        pizzaViewControllerDelegate?.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        pizzaViewControllerDelegate?.navigationController?.popViewController(animated: true)
    }
    
    func setupMargaritaImage() {
        margaritaImage.image = UIImage(named: "Маргарита")
    }
    
    func setupMargaritaLabel() {
        margaritaLabel.font = UIFont.boldSystemFont(ofSize: 26)
        margaritaLabel.textColor = .systemBlue
        margaritaLabel.textAlignment = .center
        margaritaLabel.text = "Маргарита"
    }

    func setupMargaritaButton() {
        margaritaButton.setImage(UIImage(named: "add"), for: .normal)
        margaritaButton.imageView?.contentMode = .scaleAspectFit
        margaritaButton.addTarget(self, action: #selector(tapMargaritaButton), for: .touchUpInside)
    }
    
    @objc func tapMargaritaButton() {
        margaritaButton.setupTapButton()
        let controller = IngredientViewController()
        pizzaViewControllerDelegate?.navigationController?.pushViewController(controller, animated: true)
        controller.ingredientView.pizza = "Маргарита"
    }
    
    func setupPeperoniImage() {
        peperoniImage.image = UIImage(named: "Пеперони")
    }
    
    func setupPeperoniLabel() {
        peperoniLabel.font = UIFont.boldSystemFont(ofSize: 26)
        peperoniLabel.textColor = .systemBlue
        peperoniLabel.textAlignment = .center
        peperoniLabel.text = "Пеперони"
    }
    
    func setupPeperoniButton() {
        peperoniButton.setImage(UIImage(named: "add"), for: .normal)
        peperoniButton.imageView?.contentMode = .scaleAspectFit
        peperoniButton.addTarget(self, action: #selector(tapPeperoniButton), for: .touchUpInside)
    }
        
    @objc func tapPeperoniButton() {
        peperoniButton.setupTapButton()
        let controller = IngredientViewController()
        pizzaViewControllerDelegate?.navigationController?.pushViewController(controller, animated: true)
        controller.ingredientView.pizza = "Пеперони"
    }

    func setupMargaritaImageConstraints() {
        margaritaImage.translatesAutoresizingMaskIntoConstraints = false
        
        let top = margaritaImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leading = margaritaImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
        let height = margaritaImage.heightAnchor.constraint(equalToConstant: 200)
        let width = margaritaImage.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([top, leading, height, width])
    }
    
    func setupMargaritaLabelConstraints() {
        margaritaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = margaritaLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leading = margaritaLabel.leadingAnchor.constraint(equalTo: margaritaImage.trailingAnchor)
        let trailing = margaritaLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        let height = margaritaLabel.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, leading, height, trailing])
    }
    
    func setupMargaritaButtonConstraints() {
        margaritaButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = margaritaButton.topAnchor.constraint(equalTo: margaritaLabel.bottomAnchor, constant: 16)
        let leading = margaritaButton.leadingAnchor.constraint(equalTo: margaritaImage.trailingAnchor)
        let trailing = margaritaButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        let height = margaritaButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([top, leading, height, trailing])
    }
    
    func setupPeperoniImageConstraints() {
        peperoniImage.translatesAutoresizingMaskIntoConstraints = false
        
        let top = peperoniImage.topAnchor.constraint(equalTo: margaritaImage.bottomAnchor, constant: 16)
        let leading = peperoniImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
        let height = peperoniImage.heightAnchor.constraint(equalToConstant: 200)
        let width = peperoniImage.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([top, leading, height, width])
    }
    
    func setupPeperoniLabelConstraints() {
        peperoniLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = peperoniLabel.topAnchor.constraint(equalTo: margaritaImage.bottomAnchor, constant: 16)
        let leading = peperoniLabel.leadingAnchor.constraint(equalTo: peperoniImage.trailingAnchor)
        let trailing = peperoniLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        let height = peperoniLabel.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([top, leading, height, trailing])
    }
    
    func setupPeperoniButtonConstraints() {
        peperoniButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = peperoniButton.topAnchor.constraint(equalTo: peperoniLabel.bottomAnchor, constant: 16)
        let leading = peperoniButton.leadingAnchor.constraint(equalTo: peperoniImage.trailingAnchor)
        let trailing = peperoniButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        let height = peperoniButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([top, leading, height, trailing])
    }
    
}
