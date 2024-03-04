import UIKit

// MARK: - LoginUserProfileViewProtocol
protocol BirthdayUserProfileViewProtocol: UIView {
    var delegate: BirthdayViewControllerProtocol? { get set }
}

class BirthdayUserProfileView: UIView, BirthdayUserProfileViewProtocol {
    
    weak var delegate: BirthdayViewControllerProtocol?
    private let personLabel: UILabel
    
    init() {
        self.personLabel = UILabel()
        super.init(frame: .zero)
        setupUserView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


private extension BirthdayUserProfileView {
    
    func setupUserView() {
        backgroundColor = .white
        personLabel.font = UIFont.boldSystemFont(ofSize: 12)
        personLabel.textColor = .systemBlue
        addSubview(personLabel)
        setupPersonLabelConstraints()
    }
    
    func setupPersonLabelConstraints() {
        personLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = personLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20)
        let leading = personLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
        let trailing = personLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        let height = personLabel.heightAnchor.constraint(equalToConstant: 80)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
}
