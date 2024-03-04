import UIKit

// MARK: - BirthdayViewControllerProtocol
protocol ProfileViewControllerProtocol: AnyObject {
    func navigate(_ type: NavigateType)
    var birthdayUserProfileView: BirthdayUserProfileViewProtocol? { set get }
}

class ProfileViewController: UIViewController, ProfileViewControllerProtocol {
    
    weak var birthdayUserProfileView: BirthdayUserProfileViewProtocol?
    private let router: LoginRouterProtocol
    private let profileUserView: ProfileUserViewProtocol
    
    
    init() {
        self.router = Router()
        self.profileUserView = ProfileUserView()
        super.init(nibName: nil, bundle: nil)
        setupNavigationBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router.navigationController = navigationController
        profileUserView.delegate = self
        view = profileUserView
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
    
    private func setupNavigationBar() {
        // .plain указывает на обычный стиль кнопки без дополнительных стилевых изменений
        let addButton = UIBarButtonItem(title: "Добавить", style: .plain, target: self, action: #selector(addTapped))
        let cancelButton = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(cancelTapped))
        
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func addTapped() {
        print("Метод отработал")
    }
    
    @objc func cancelTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
