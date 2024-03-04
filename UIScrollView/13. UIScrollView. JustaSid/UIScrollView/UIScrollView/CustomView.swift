import UIKit

class CustomView: UIView {
    
    private let scrollView = UIScrollView()
    private let scrollViewDelegate = ScrollViewDelegate()
    private let imagineView = UIImageView()

    init() {
        super.init(frame: .zero)
        setupCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
     // Настройка экрана
    private func setupCustomView() {
        backgroundColor = .orange
        
        setupScrollView()
        setupScrollViewConstraints()
    }
    
    // Конфигурации scrollView
    private func setupScrollView() {
        scrollViewDelegate.imagineView = imagineView
        scrollView.delegate = scrollViewDelegate // назначаем наш класс ответственным за ответы на запросы UIScrollView и за обеспечение нужного поведения при масштабировании или других событиях, связанных с UIScrollView
        
        // рамка для возможности отличить от общего фона
        scrollView.layer.borderWidth = 1 // ширина
        scrollView.layer.borderColor = UIColor.black.cgColor // цвет рамки
        
        // поле с контентом для скроллинга
        scrollView.contentSize = CGSize(width: 600, height: 600) // размер поля
        imagineView.image = UIImage(systemName: "pencil.circle.fill") // устанавливаем системное изображение
        imagineView.frame.size = scrollView.contentSize  // приравниваем размер imagineView к размеру scrollView
        
        // scrollView.contentInset = UIEdgeInsets(top: -150, left: 15, bottom: 15, right: 15) // определяем область в которой содержимое может быть прокручено
        // scrollView.isDirectionalLockEnabled = true // запрет за прокрутку в разных областях одновременно
        scrollView.showsVerticalScrollIndicator = false // откл вертикальный индикатор прокрутки
        scrollView.showsHorizontalScrollIndicator = false // откл горизонтальный индикатор прокрутки
        
        // увеличение (zoom)
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
        
        addSubview(scrollView)
        scrollView.addSubview(imagineView) // добавление системного изображения на ScrollView
        animationScrollView() // вызов анимации скроллинга после запуска приложения
        
    }
    
    // Размещение scrollView
    private func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = scrollView.centerXAnchor.constraint(equalTo: centerXAnchor)
        let centerY = scrollView.centerYAnchor.constraint(equalTo: centerYAnchor)
        let width = scrollView.widthAnchor.constraint(equalToConstant: 200)
        let height = scrollView.heightAnchor.constraint(equalToConstant: 200)
        
        let items = [centerX, centerY, width, height]
        NSLayoutConstraint.activate(items)
    }
    
    // анимация после запуска приложение
    private func animationScrollView() {
        //
        /*DispatchQueue предоставляет интерфейс для управления выполнением задач в многопоточной среде. Он используется для планирования выполнения работы асинхронно или с определенной задержкой. Может иметь различные очереди для выполнения задач: - main: очередь, связанная с основным потоком (UI потоком) приложения. Все операции, которые воздействуют на пользовательский интерфейс, должны выполняться на этой очереди. Использование DispatchQueue.main гарантирует, что код будет выполнен на главной очереди (главном потоке) приложения.
         DispatchTime.now() - метод, возвращающий текущее время в виде тчк во времени (DispatchTime)*/
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // замыкание будет выполнено через одну сеунду от времени запуска
            self.scrollView.setContentOffset(CGPoint(x: 150, y: 150), animated: true) // в контексте данного метода, использование self явно указывает на использование scrollView  именно из текущего объекта, где определен метод animationScrollView()
        }
    }

}

// MARK: - ScrollViewDelegate
class ScrollViewDelegate: NSObject, UIScrollViewDelegate {
    
    weak var imagineView: UIImageView?
    
    // MARK: delegate
    /* Метод, указывающий UIScrollView, какая часть внутри него должна меняться. Он спрашивает у делегата (CustomView) какое представление нужно изменять. Делегат в соответствии с запросом viewForZooming возвращает часть, которую нужно изменить, затем viewForZooming возвращает эту часть измененной.*/
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imagineView
    }
    
}
