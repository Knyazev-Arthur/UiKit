import UIKit

// MARK: - UserProfileViewProtocol
protocol PageViewProtocol: UIView {
    var delegatePageController: PageControllerProtocol? { get set }
    var device: String { get set }
}

class PageView: UIView, PageViewProtocol {
    
    var device: String = "" {
        didSet {
            setupPageView()
        }
    }
    weak var delegatePageController: PageControllerProtocol?
    private let appleScroll: UIScrollView
    private var appleImageArray: [UIImageView]
    private let widthScroll = UIScreen.main.bounds.width
    private let heightScroll = UIScreen.main.bounds.height / 3
    
    init() {
        self.appleScroll = UIScrollView()
        self.appleImageArray = [UIImageView]()
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension PageView {
    
    func setupPageView() {
        delegatePageController?.pageView = self
        backgroundColor = .cyan
        setupArrayDevice()
        setupAppleScroll()
        addSubview(appleScroll)
        setupAppleScrollViewConstraints()
    }
    
    func setupArrayDevice() {
        switch device {
        case "iPhone":
            appleImageArray = [UIImageView(image: UIImage(named: "iPhoneOne")),
                               UIImageView(image: UIImage(named: "iPhoneTwo")),
                               UIImageView(image: UIImage(named: "iPhoneThree"))]
        case "iPad":
            appleImageArray = [UIImageView(image: UIImage(named: "iPadOne")),
                               UIImageView(image: UIImage(named: "iPadTwo")),
                               UIImageView(image: UIImage(named: "iPadThree"))]
        case "macBook":
            appleImageArray = [UIImageView(image: UIImage(named: "macBookOne")),
                               UIImageView(image: UIImage(named: "macBookTwo")),
                               UIImageView(image: UIImage(named: "macBookThree"))]
        default: break
        }
    }
    
    func setupAppleScroll() {
        for subview in appleScroll.subviews {
            subview.removeFromSuperview()
        }

        for (index, imageView) in appleImageArray.enumerated() { // добавляем изображения в scrollView
            // вычисляем позицию для каждого изображения внутри scrollView
            let xOffset = CGFloat(index) * widthScroll * 0.5
            imageView.frame = CGRect(x: xOffset, y: 0, width: widthScroll * 0.5, height: heightScroll)
            
            appleScroll.addSubview(imageView)
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        }
        
        appleScroll.contentSize = CGSize(width: widthScroll * 0.5 * CGFloat(appleImageArray.count), height: heightScroll) // устанавливаем размер contentSize равным общей ширине всех изображений
        appleScroll.isDirectionalLockEnabled = true
    }
    
    @objc func imageTapped(_ gesture: UITapGestureRecognizer) {
        
        let controller = WebViewController()
        delegatePageController?.navigationController?.pushViewController(controller, animated: true)
        
        switch device {
        case "iPhone":
            controller.userWebView.device = "iPhone"
        case "iPad":
            controller.userWebView.device = "iPad"
        case "macBook":
            controller.userWebView.device = "macBook"
        default:
            break
        }
    }
    
    func setupAppleScrollViewConstraints() {
        appleScroll.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = appleScroll.centerXAnchor.constraint(greaterThanOrEqualTo: centerXAnchor)
        let centerY = appleScroll.centerYAnchor.constraint(greaterThanOrEqualTo: centerYAnchor)
        let width = appleScroll.widthAnchor.constraint(equalToConstant: widthScroll)
        let height = appleScroll.heightAnchor.constraint(equalToConstant: heightScroll)
        
        NSLayoutConstraint.activate([centerY, centerX, width, height])
    }
    
}
