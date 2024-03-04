import UIKit

// MARK: - UserProfileViewProtocol
protocol ShowcaseViewProtocol: UIView {
    var delegateShowcaseController: ShowcaseController? { get set }
}

class ShowcaseView: UIView, ShowcaseViewProtocol {
    
    weak var delegateShowcaseController: ShowcaseController?
    private let appleScrollView: UIScrollView
    private let iPhoneImageView: UIImageView
    private let iPadImageView: UIImageView
    private let macBookImageView: UIImageView
    private let widthScroll = UIScreen.main.bounds.width
    private let heightScroll = UIScreen.main.bounds.height / 3
    
    init() {
        self.appleScrollView = UIScrollView()
        self.iPhoneImageView = UIImageView()
        self.iPadImageView = UIImageView()
        self.macBookImageView = UIImageView()
        
        super.init(frame: .zero)
        setupShowcaseView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension ShowcaseView {
    
    func setupShowcaseView() {
        backgroundColor = .cyan
        
        setupAppleScrollView()
        setupIPhoneImageView()
        setupIPadImageView()
        setupMacBookImageView()
        
        addSubview(appleScrollView)
        appleScrollView.addSubview(iPhoneImageView)
        appleScrollView.addSubview(iPadImageView)
        appleScrollView.addSubview(macBookImageView)
        
        setupAppleScrollViewConstraints()
        setupIPhoneImageViewConstraints()
        setupIPadImageViewConstraints()
        setupMacBookImageViewConstraints()
    }
    
    func setupIPhoneImageView() {
        iPhoneImageView.image = UIImage(named: "iPhone")
        iPhoneImageView.contentMode = .scaleAspectFit
        iPhoneImageView.isUserInteractionEnabled = true
        iPhoneImageView.tag = 0
        iPhoneImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
    }
    
    func setupIPadImageView() {
        iPadImageView.image = UIImage(named: "iPad")
        iPadImageView.contentMode = .scaleAspectFit
        iPadImageView.isUserInteractionEnabled = true
        iPadImageView.tag = 1
        iPadImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
    }
    
    func setupMacBookImageView() {
        macBookImageView.image = UIImage(named: "macBook")
        macBookImageView.contentMode = .scaleAspectFit
        macBookImageView.isUserInteractionEnabled = true
        macBookImageView.tag = 2
        macBookImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
    }
    
    @objc func imageTapped(_ image: UITapGestureRecognizer) {
        let controller = PageController()
        delegateShowcaseController?.navigationController?.pushViewController(controller, animated: true)
        switch image.view?.tag {
            case 0: controller.pageView.device = "iPhone"
            case 1: controller.pageView.device = "iPad"
            case 2: controller.pageView.device = "macBook"
            default: break
        }
        
    }
    
    func setupAppleScrollView() {
        appleScrollView.contentSize = CGSize(width: widthScroll * 1.6, height: heightScroll) // размеры области скроллинга
        appleScrollView.isDirectionalLockEnabled = true
    }
    
    func setupAppleScrollViewConstraints() {
        appleScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = appleScrollView.centerXAnchor.constraint(greaterThanOrEqualTo: centerXAnchor)
        let centerY = appleScrollView.centerYAnchor.constraint(greaterThanOrEqualTo: centerYAnchor)
        let width = appleScrollView.widthAnchor.constraint(equalToConstant: widthScroll)
        let height = appleScrollView.heightAnchor.constraint(equalToConstant: heightScroll)
        
        NSLayoutConstraint.activate([centerY, centerX, width, height])
    }
    
    func setupIPhoneImageViewConstraints() {
        iPhoneImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = iPhoneImageView.topAnchor.constraint(equalTo: appleScrollView.topAnchor)
        let leading = iPhoneImageView.leadingAnchor.constraint(equalTo: appleScrollView.leadingAnchor)
        let width = iPhoneImageView.widthAnchor.constraint(equalToConstant: widthScroll * 0.5)
        let height = iPhoneImageView.heightAnchor.constraint(equalToConstant: heightScroll)

        NSLayoutConstraint.activate([top, leading, width, height])
    }
    
    func setupIPadImageViewConstraints() {
        iPadImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = iPadImageView.topAnchor.constraint(equalTo: appleScrollView.topAnchor)
        let leading = iPadImageView.leadingAnchor.constraint(equalTo: iPhoneImageView.trailingAnchor, constant: 10)
        let width = iPadImageView.widthAnchor.constraint(equalToConstant: widthScroll * 0.5)
        let height = iPadImageView.heightAnchor.constraint(equalToConstant: heightScroll)

        NSLayoutConstraint.activate([top, leading, width, height])
    }
    
    func setupMacBookImageViewConstraints() {
        macBookImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = macBookImageView.topAnchor.constraint(equalTo: appleScrollView.topAnchor)
        let leading = macBookImageView.leadingAnchor.constraint(equalTo: iPadImageView.trailingAnchor, constant: 16)
        let width = macBookImageView.widthAnchor.constraint(equalToConstant: widthScroll * 0.5)
        let height = macBookImageView.heightAnchor.constraint(equalToConstant: heightScroll)

        NSLayoutConstraint.activate([top, leading, width, height])
    }
    
}
