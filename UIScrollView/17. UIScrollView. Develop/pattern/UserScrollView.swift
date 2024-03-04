import UIKit

// MARK: - UserProfileViewProtocol
protocol UserScrollViewProtocol: UIScrollView {
    var delegateScrollView: DelegateScrollViewProtocol { get set }
}

class UserScrollView: UIScrollView, UserScrollViewProtocol {
    
    var delegateScrollView: DelegateScrollViewProtocol
    private let imageView: UIImageView

    init() {
        self.imageView = UIImageView()
        self.delegateScrollView = DelegateScrollView()
        super.init(frame: .zero)
        setupUserScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension UserScrollView {
    
    func setupUserScrollView() {
        delegate = delegateScrollView
        delegateScrollView.userScrollView = self
        setupImageView()
        addSubview(imageView)
        contentSize = imageView.bounds.size // область контента для скроллинга равна размеру imageView
    }
    
    func setupImageView() {
        guard let image = UIImage(named: "mac") else { return }
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height) // устанавливаем размеры imageView равными размеру изображения для отображения на scrollView.
    }
    
}
