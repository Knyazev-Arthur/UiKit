import UIKit

class UserProfileView: UIView {
    
    private let topLabel: UILabel
    private let imageView: UIImageView
    private let button: UIButton
    private let activityIndicator: UIActivityIndicatorView
    
    private let progress = Progress(totalUnitCount: 11)
    private var timer: Timer
    
    init() {
        self.topLabel = UILabel()
        self.imageView = UIImageView()
        self.button = UIButton()
        self.activityIndicator = UIActivityIndicatorView()
        self.timer = Timer()
                
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserProfileView() {
        backgroundColor = .green
        
        addSubview(topLabel)
        addSubview(imageView)
        addSubview(activityIndicator)
        addSubview(button)
        
        setupElement()
    }
    
    private func setupElement() {
        setupTopLabel()
        setupImageView()
        setupButton()
        setupActivityIndicator()
        
        setupTopLabelConstraints()
        setupImageViewConstraints()
        setupButtonConstraints()
        setupActivityIndicatorConstraints()
        
        setupProgress()
    }

    private func setupTopLabelConstraints() {
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = topLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
        let centerX = topLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let bottom = topLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -16)
        
        NSLayoutConstraint.activate([top, centerX, bottom])
    }

    private func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let width = imageView.widthAnchor.constraint(equalToConstant: 350)
        let height = imageView.heightAnchor.constraint(equalToConstant: 350)
        let centerX = imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        
        NSLayoutConstraint.activate([width,height,centerX])
    }
    
    private func setupActivityIndicatorConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        let centerX = activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerY = activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)

        NSLayoutConstraint.activate([centerY,centerX])
    }

    private func setupButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false

        let top = button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16)
        let centerX = button.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let width = button.widthAnchor.constraint(equalTo: imageView.widthAnchor)
        let height = button.heightAnchor.constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([top,centerX,width,height])
    }
    
    private func setupTopLabel() {
        topLabel.text = "Что привело тебя?"
        topLabel.textAlignment = .center
        topLabel.font = UIFont.systemFont(ofSize: 20)
        topLabel.numberOfLines = 0
    }
    
    private func setupImageView() {
        imageView.image = UIImage(named: "1")
    }
    
    private func setupActivityIndicator() {
        //activityIndicator.progressViewStyle = .bar
        activityIndicator.tintColor = .red
        //activityIndicator.observedProgress = progress
    }
    
    private func setupButton() {
        button.setTitle("Чем мне заняться сегодня?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    private func setupProgress() { // выполнение не на главной очереди
        progress.cancellationHandler = { // обработчик отмены операции
            DispatchQueue.main.async { // помещаем выполнение замыкания в асинхронную очередь главной потоковой очереди, где выполняется обновление интерфейса
                self.updateWidthAnimation(task: { // анимация изменения ширины элементов интерфейса
                    self.topLabel.alpha = 0
                    self.imageView.alpha = 0
                }, completion: {
                    self.topLabel.alpha = 1
                    self.imageView.alpha = 1
                    self.topLabel.text = Source.getTask()
                    self.imageView.image = UIImage(named: "1")
                })
            }
        }
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        DispatchQueue.main.async { // выполнение кода асинхронно
            self.updateWidthAnimation(task: {
                self.topLabel.alpha = 0
                self.imageView.alpha = 0
            }, completion: {
                self.topLabel.alpha = 1
                self.imageView.alpha = 1
                self.topLabel.text = "Думаю..."
                self.imageView.image = UIImage(named: "2")
            })
            
            var count: Int64 = 0
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { timer in
                if self.progress.fractionCompleted == 1 {
                    self.progress.cancel()
                    timer.invalidate()
                }
                
                self.progress.completedUnitCount = count
                count += 1
            })
        }
    }
    
    private func updateWidthAnimation(task: @escaping ()-> Void, completion: @escaping ()-> Void) {
        UIView.animate(withDuration: 0.25, animations: task) { _ in
            UIView.animate(withDuration: 0.25, animations: completion)
        }
    }
}
