import UIKit

class UserProfileView: UIView {

    private let progressView: UIProgressView
    private let progress = Progress(totalUnitCount: 11) // кол-во едениц, используемых для отслеживания прогресса
    
    init() {
        self.progressView = UIProgressView()
        super.init(frame: .zero)
        
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserProfileView() {
        backgroundColor = .green
        addSubview(progressView)
        setupProgressView()
        setupProgressViewConstraints()
        setupTimer()
    }

    private func setupProgressViewConstraints() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerY = progressView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let width = progressView.widthAnchor.constraint(equalToConstant: 300)
        let height = progressView.heightAnchor.constraint(equalToConstant: 10)
        
        NSLayoutConstraint.activate([centerX,centerY,width,height])
    }
    
    private func setupProgressView() {
        progressView.progress = 0.1
        progressView.tintColor = .red
        progressView.trackTintColor = .green
        progressView.observedProgress = progress // связываем progressView с экземпляром progress, что позволяет progressView автоматически обновлять свой прогресс на основе изменений в progress
    }
    
    private func setupTimer() {
        var count: Int64 = 0 // переменная для остлеживания прогресса
        // объявляем таймер, запускающий замыкание каждые 0.2 секунды
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            if self.progress.isCancelled { // если прогресс отменен
                timer.invalidate() // остановка таймера
            }
            if self.progress.fractionCompleted == 1 {
                self.progress.cancel() // отмена прогресса
            }
            self.progress.completedUnitCount = count
            count += 1
        }
        progress.cancellationHandler = {
            print("progress was stopped")
        }
    }
    
}
