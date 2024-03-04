import UIKit

// MARK: - BirthdayViewControllerProtocol
protocol BirthdayViewControllerProtocol: AnyObject {
    func navigate(_ type: NavigateType)
}

class BirthdayViewController: UIViewController, BirthdayViewControllerProtocol {
    
    private let router: LoginRouterProtocol
    private let birthdayUserProfileView: BirthdayUserProfileViewProtocol
    
    init() {
        self.router = Router()
        self.birthdayUserProfileView = BirthdayUserProfileView()
        super.init(nibName: nil, bundle: nil)
        setupBarButtonItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router.navigationController = navigationController
        birthdayUserProfileView.delegate = self
        view = birthdayUserProfileView
        title = "Birthday"
    }
    
    func navigate(_ type: NavigateType) {
        switch type {
            case .push(let viewController):
                router.push(viewController)
            case .present(let viewController):
                router.present(viewController)
            case .bithdayViewController:
                router.pushBirthdayViewController()
        }
    }
    
    private func setupBarButtonItem() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped)) // инициализация экземпляра UIBarButtonItem (кнопки) с системным изображением + (.add)
        navigationItem.rightBarButtonItem = addButton // установка кнопки в правой части навигационной панели
    }
    
    @objc func addButtonTapped() {
        let nextViewController = ProfileViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
