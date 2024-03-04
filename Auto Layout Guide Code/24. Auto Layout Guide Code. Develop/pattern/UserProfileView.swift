import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    private let redLabel = UILabel()
    private let blueLabel = UILabel()
    private let labelVFL: [String : UILabel]
    private let metrics: [String : CGFloat]
    
    init() {
        labelVFL = ["redLabel": redLabel, "blueLabel": blueLabel]
        metrics = ["height": 100, "width": 100, "top": UIScreen.main.bounds.height / 2]
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = .cyan
        redLabel.backgroundColor = .red
        blueLabel.backgroundColor = .blue
        
        addSubview(redLabel)
        addSubview(blueLabel)
        
        setupRedLabelContraints()
        setupBlueLabelContraints()
        setupLabelConstraints()
    }
    
    func setupRedLabelContraints() {
        redLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[redLabel(height)]-(top)-|",
                                                                   options: [],
                                                                   metrics: metrics,
                                                                   views: labelVFL))
    }

    func setupBlueLabelContraints() {
        blueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[blueLabel(height)]-(top)-|",
                                                                   options: [],
                                                                   metrics: metrics,
                                                                   views: labelVFL))
    }
    
    func setupLabelConstraints() {
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[redLabel(width)]-(110)-[blueLabel(redLabel)]-|",
                                                                   options: [],
                                                                   metrics: metrics,
                                                                   views: labelVFL))
    }
    
}
