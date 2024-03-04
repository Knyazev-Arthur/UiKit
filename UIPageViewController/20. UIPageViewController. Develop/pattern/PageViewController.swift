import UIKit

class PageViewController: UIPageViewController {
    
    private var bmw = CarsHelper()
    private var audi = CarsHelper()
    private var cars = [CarsHelper]()
    private var arrayCarViewController = [CarViewController]()
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        setupPageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func setupPageView() {
        delegate = self
        dataSource = self
        title = "Cars"
        view.backgroundColor = .black

        bmw = CarsHelper(name: "Car - BMW", image: UIImage(named: "bmw") ?? UIImage())
        audi = CarsHelper(name: "Car - AUDI", image: UIImage(named: "audi") ?? UIImage())
        cars = [bmw, audi]
        
        for car in cars {
            arrayCarViewController.append(CarViewController(carWith: car))
        }
        
        setViewControllers([arrayCarViewController[0]], direction: .forward, animated: true, completion: nil)
    }
    
    // метод для отображения контроллера, который представляется перед текущим
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = arrayCarViewController.firstIndex(of: viewController) { // находим индекс текущего контроллера с помощью метода firstIndex(of: в массиве
            if index > 0 { // проверяем, что текущий контроллер не является первым в массиве.
                return arrayCarViewController[index - 1] // возвращаем контроллер, предшествующий текущему (index - 1). Если индекс 0, возвращается nil, т.к. нет предыдущего контроллера.
            }
        }
        return nil
    }
    
    // метод для отображения контроллера, который представляется после текущего
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = arrayCarViewController.firstIndex(of: viewController) {
            if index < cars.count - 1 { // проверяем, что текущий контроллер не является последним в массиве.
                return arrayCarViewController[index + 1] // возвращаем контроллер, следующий за текущим (index + 1). Если индекс = cars.count - 1, возвращается nil, так как нет следующего контроллера
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        cars.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    
}
