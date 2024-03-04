import UIKit

class CustomView: UIView, UIScrollViewDelegate {
    
    private let scrollView = UIScrollView()
    private let label = UILabel()
    private let button = UIButton()

    init() {
        super.init(frame: .zero)
        setupCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupCustomView() {
        backgroundColor = .orange
        
        setupElements()
        setupElementsConstraints()
    }
    
    private func setupElements() {
        setupScrollView()
        setupLabel()
        setupButton()
    }
    
    private func setupElementsConstraints() {
        setupScrollViewConstraints()
        setupLabelConstraints()
        setupButtonConstraints()
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.addSubview(button)
        scrollView.addSubview(label)
        
        // scrollView.scrollsToTop = false // откл подъем к верхней части экрана путем нажатия на левый верхний угол
        scrollView.delegate = self
    }
    
    private func setupLabel() {
        label.numberOfLines = 0
        label.textAlignment = .natural
        label.text = "Настоящим Вы даете свое добровольное, осознанное и безусловное согласие на обработку своих персональных данных.Вы разрешаете собирать, систематизировать, накапливать, хранить, уточнять (обновлять, изменять), использовать, обезличивать, передавать третьим лицам, блокировать, удалять и уничтожать мои персональные данные с соблюдением требований действующего законодательства о персональных данных. Вы предоставляете свои персональные данные для обработки с целью выполнения договорных обязательств, участия в программе/мероприятии/конкурсе, получения информации о продуктах, услугах, специальных предложениях и мероприятиях, проводимых или предоставляемых компанией/организацией и ее партнерами. Вы подтверждаете, что предоставляемая мной информация является точной и полной. Вы понимаете, что имею право в любой момент отозвать свое согласие путем предоставления письменного уведомления. Также Вы осведомлены о том, что мои персональные данные не будут передаваться третьим лицам без моего согласия, за исключением случаев, предусмотренных законодательством. Вы соглашаетесь с тем, что компания/организация имеет право обрабатывать мои персональные данные в целях связи со мной, предоставления информации о товарах/услугах, проведения опросов и исследований рынка. На согласие на обработку Ваших персональных данных распространяются все условия и сроки их действия, указанные в действующем законодательстве о персональных данных. Этот текст может быть адаптирован и дополнен в соответствии с конкретными требованиями и особенностями обработки персональных данных."
    }
    
    private func setupButton() {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.setTitle("OK", for: .normal)
    }

    private func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let bottom = scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let leading = scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailing = scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        let items = [top,bottom,leading,trailing]
        NSLayoutConstraint.activate(items)
    }
    
    private func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let top = label.topAnchor.constraint(equalTo: scrollView.topAnchor)
        let width = label.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        let leading = label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
        let trailing = label.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        
        let items = [top,width,leading,trailing]
        NSLayoutConstraint.activate(items)
    }
    
    private func setupButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let top = button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16)
        let bottom = button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        let leading = button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
        let trailing = button.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        
        let items = [top,bottom,leading,trailing]
        NSLayoutConstraint.activate(items)
    }
    
    // метод отслеживающий подъем к верхней тчк экрана
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("scrol to top")
    }
    // метод работающий аналогично crollView.scrollsToTop = false
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return false
    }
}
