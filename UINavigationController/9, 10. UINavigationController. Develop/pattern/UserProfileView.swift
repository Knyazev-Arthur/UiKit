import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var viewControllerDelegate: ViewController? { get set }
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    weak var viewControllerDelegate: ViewController?
    private let imageTitle: UIImageView
    private let switchBar: UISwitch

    init() {
        self.imageTitle = UIImageView()
        self.switchBar = UISwitch()
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // didMoveToSuperview вызывается после того, как вью добавлено в иерархию представлений
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupView()
    }

}

private extension UserProfileView {
    
    func setupView() {
        backgroundColor = UIColor(ciColor: .cyan)
        setupNavigationItem()
        setupImageTitle()
        setupSwitch()
        setupNavigationItem()
    }
    
    func setupNavigationItem() {
        
        // инициализация зоны title бара кастомным изображением
        viewControllerDelegate?.navigationItem.titleView = imageTitle
        
        // инициализация правой зоны бара системным изображением
        viewControllerDelegate?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera,
                                                                                    target: self,
                                                                                    action: #selector(notificationAdd))
        // инициализация левой зоны бара элементом
        viewControllerDelegate?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: switchBar)
    }
    
    @objc func notificationAdd() {
        print("Add click")
    }
    
    func setupImageTitle() {
        imageTitle.frame = .init(x: 0, y: 0, width: 30, height: 15)
        imageTitle.contentMode = .scaleAspectFill
        imageTitle.image = UIImage(named: "apple")
    }
    
    func setupSwitch() {
        switchBar.isOn = true
        switchBar.addTarget(self, action: #selector(switchIsChange), for: .valueChanged)
    }
    
    @objc func switchIsChange(param: UISwitch) {
        let status = param.isOn ? "Switch is on" : "Switch is off"
        print(status)
    }
    
}
