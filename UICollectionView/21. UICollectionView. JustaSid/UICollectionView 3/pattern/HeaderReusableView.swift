import UIKit

class HeaderReusableView: UICollectionReusableView {
    
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        setupTitleLabel()
        setupTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText(_ text: String) {
        titleLabel.text = text
    }
    
}

private extension HeaderReusableView {
   
    func setupTitleLabel() {
        titleLabel.layer.borderColor = UIColor.green.cgColor
        titleLabel.layer.borderWidth = 2
        titleLabel.layer.cornerRadius = 5
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 24)
    }
    
    func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8)
        let leading = titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
        let trailing = titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        let bottom = titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        
        NSLayoutConstraint.activate([top,bottom,leading,trailing])
    }
}
