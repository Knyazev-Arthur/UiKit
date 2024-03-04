import UIKit

class UserProfileView: UIView {
    
    private let label: UILabel
    
    init() {
        self.label = UILabel()
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = UIColor(ciColor: .cyan)
        setupLabel()
        addSubview(label)
        setupLabelConstraints()
        swipesObservers()
        tapObserver()
    }
    
    func setupLabel() {
        label.text = "Gester Recognizer"
        label.shadowOffset.height = -1
        label.highlightedTextColor = .black
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.numberOfLines = 0
    }
    
    func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerY = label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let height = label.heightAnchor.constraint(equalToConstant: 150)
        let width = label.widthAnchor.constraint(equalToConstant: 350)
        
        NSLayoutConstraint.activate([centerX, centerY, height, width])
    }
    
    func swipesObservers() { // метод для наблюдения за жестами
        
        // добавляем жест свайпа вправо
        let swipeRigth = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRigth.direction = .right
        addGestureRecognizer(swipeRigth)
        
        // добавляем жест свайпа влево
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        addGestureRecognizer(swipeLeft)
        
        // добавляем жест свайпа вверх
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        addGestureRecognizer(swipeUp)
        
        // добавляем жест свайпа вниз
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        addGestureRecognizer(swipeDown)
    }
    
    func tapObserver() {
        
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        tripleTap.numberOfTapsRequired = 3
        addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTap)
    }
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        
        switch gester.direction {
        case .right:
            label.text = "Right swipe was recognized"
        case .left:
            label.text = "Left swipe was recognized"
        case .up:
            label.text = "Up swipe was recognized"
        case .down:
            label.text = "Down swipe was recognized"
        default:
            break
        }
    }
    
    @objc func tripleTapAction() {
        label.text = "Triple taped was recognized"
    }
    
    @objc func doubleTapAction() {
        label.text = "Double taped was recognized"
    }
}
