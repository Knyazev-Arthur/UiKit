import UIKit

class UserProfileView: UIView, UserProfileViewProtocol {
    
    var scrolViewDelegate: ScrollViewDelegateProtocol?
    private let scrollView: UIScrollView
    private let strings: [String]
    private let pageControl: UIPageControl
    
    init() {
        self.scrolViewDelegate = ScrollViewDelegate()
        self.scrollView = UIScrollView()
        self.strings = ["one", "two", "three"]
        self.pageControl = UIPageControl()
        
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCurrentPageScrollView(_ point: Int) {
        pageControl.currentPage = point
    }

}

// MARK: UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var scrolViewDelegate: ScrollViewDelegateProtocol? { get set }
}

private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = .white
        
        setupScrollView()
        setupPageControl()
        
        addSubview(scrollView)
        addSubview(pageControl)
        
        setupscrollViewConstrains()
        setupPageControlConstraints()
    }
    
    func setupscrollViewConstrains() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        let leading = scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailimg = scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let height = scrollView.heightAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([top, leading, trailimg, height])
    }
    
    func setupPageControlConstraints() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        let top = pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 16)
        let centerX = pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor)

        NSLayoutConstraint.activate([top, centerX])
    }
    
    func setupScrollView() {
        scrollView.delegate = scrolViewDelegate
        scrolViewDelegate?.userProfile = self
        
        let width = Int(UIScreen.main.bounds.width) * strings.count // ширина экрана * на кол-во элементов в массиве strings
        scrollView.contentSize = CGSize(width: width, height: 200) // размер области, которую пользователь может прокручивать
        scrollView.backgroundColor = .systemGray
        scrollView.isPagingEnabled = true // отображение содержимого страницами для перелистывания, как в книге
        
        // добавлем
        addLabel(title: strings[0], position: 0)
        addLabel(title: strings[1], position: 1)
        addLabel(title: strings[2], position: 2)
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = strings.count
        pageControl.pageIndicatorTintColor = .black // цвет неактивных индикаторов
        pageControl.currentPageIndicatorTintColor = .red // цвет активного индикатора
        pageControl.hidesForSinglePage = true // при одной страницы pageControl отображен не будет
        pageControl.addTarget(self, action: #selector(pageDidChange), for: .valueChanged)
    }
    
    func addLabel(title: String, position: CGFloat) {
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        let screenWidth = UIScreen.main.bounds.width // bounds - прямоугольник описывающий границы текущего экрана
        label.frame = CGRect(x: screenWidth * position, y: 0, width: screenWidth, height: 200) // каждая метка размещается рядом с другой
        scrollView.addSubview(label)
    }
    
    @objc func pageDidChange(_ sender: UIPageControl) {
        let offsetX = UIScreen.main.bounds.width * CGFloat(pageControl.currentPage) // вычисляем смешение по оси Х
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true) // устанавливаем смещение contentOffset
    }
    
}
