import UIKit

class ViewController: UIViewController {
    
    private let userScrollView: UserScrollViewProtocol
    
    init() {
        userScrollView = UserScrollView()
        super.init(nibName: nil, bundle: nil)
        view.addSubview(userScrollView)
        view.backgroundColor = .white
        setupUserProfileViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserProfileViewConstraints() {
        userScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = userScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trailing = userScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let top = userScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let bottom = userScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }

}
