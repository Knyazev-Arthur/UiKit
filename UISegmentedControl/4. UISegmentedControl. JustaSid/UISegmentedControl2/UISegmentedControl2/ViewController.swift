import UIKit
// определение класса, являющегося наследником свойств класса UIViewController. Отвечает за управление отображением пользовательского интерфейса и его взаимодействием с приложением.
class ViewController: UIViewController {
    //
    /* IBOutlet - это ключевое слово в Objective-C и Swift, используемое в Xcode для обозначения свойств в коде, которые связываются с элементами пользовательского интерфейса на сториборде (Interface Builder). Это позволяет программистам создавать ссылки между кодом и интерфейсом приложения, обеспечивая доступ к элементам интерфейса из кода.
     В Swift IBOutlet используется для свойств, которые представляют элементы пользовательского интерфейса, такие как UILabel, UIButton, UIImageView, и другие. После связывания свойства с элементом интерфейса через Interface Builder, можно взаимодействовать с этим элементом напрямую из кода.*/
    @IBOutlet weak var heroImagieView: UIImageView!
    //
    /* объявляем переменную типа UISegmentedControl для использования соответствующих свойств. Тип optional, посокольку в начале приложения она может быть пустой (nil), но предполагается, что после переопредления viewDidLoad() у нее будет значение */
    var segmentControl: UISegmentedControl!
    //
    /*Переопределение метода жизненного цикла контроллера, который вызывается один раз после загрузки представления контроллера в память, но перед тем, как оно будет показано пользователю. Выполняет начальные настройки интерфейса, например, установка начальных значений для элементов управления, настройка их внешнего вида или загрузка данных.*/
    override func viewDidLoad() {
        super.viewDidLoad() // вызов метода родительского класса для запуска базовой логики перед выполнением собственных настроек
        
        let heroes = ["knight", "archer", "mage"] // объявляем массив с названием сегментов segmentedControl
        segmentControl = UISegmentedControl(items: heroes) // инициализация segmentedControl сегментами

        //
        /* Когда изображение не соответствует размерам UIImageView, contentMode определяет, как будет масштабироваться и отображаться это изображение внутри UIImageView. scaleToFill - это один из режимов contentMode, который масштабирует изображение так, чтобы оно полностью заполняло размеры UIImageView, сохраняя при этом пропорции.*/
        heroImagieView.contentMode = .scaleToFill
        
        // устанавливаем шрифт и цвет текста для нормального состояния сегмента
        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Arial", size: 18)!,
            NSAttributedString.Key.foregroundColor : UIColor.lightGray],
                                              for: .normal)
        // устанавливаем шрифт и цвет текста для состояния сегмента при его выборе
        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Arial", size: 30)!,
            NSAttributedString.Key.foregroundColor : UIColor.purple],
                                              for: .selected)
        //
        /* устанавливает обработчик события (метод segmentAction(sender:)), который будет вызываться при изменении значения UISegmentedControl */
        segmentControl.addTarget(self, action: #selector(segmentAction(sender:)), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
                                               
        view.addSubview(segmentControl) // добавляем segmentControl на экран
        segmentControl.translatesAutoresizingMaskIntoConstraints = false // отключаем автоматическое применение констрейнтов
        NSLayoutConstraint.activate([ // устанавливаем констрейнты для размещения segmentControl относительно heroImagieView
            segmentControl.topAnchor.constraint(equalTo: heroImagieView.bottomAnchor, constant: 16),
            segmentControl.leadingAnchor.constraint(equalTo: heroImagieView.leadingAnchor, constant: 16),
            segmentControl.trailingAnchor.constraint(equalTo: heroImagieView.trailingAnchor, constant: -16),
            segmentControl.heightAnchor.constraint(equalTo: heroImagieView.heightAnchor, constant: 48)])
    }
     
    @objc func segmentAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: changeHero(for: 1)
        case 1: changeHero(for: 2)
        case 2: changeHero(for: 3)
        default: break
        }
    }
    //
    /* функция changeHero(for:) используется для изменения изображения героя на основе переданного индекса. Она начинает с анимации изменения прозрачности heroImagieView до нуля за 0.5 секунды (UIView.animate).
     После завершения этой анимации (в блоке завершения), запускается вторая анимация снова через UIView.animate, которая возвращает прозрачность heroImagieView обратно к полной видимости (alpha = 1) и устанавливает новое изображение героя (heroImagieView.image = UIImage(named: "\(index)")!). Имя изображения героя формируется из значения параметра index и используется для загрузки соответствующего изображения из ресурсов приложения. */
    func changeHero(for index: Int) {
        UIView.animate(withDuration: 0.5, animations: { self.heroImagieView.alpha = 0 }) { _ in
            UIView.animate(withDuration: 0.5) {
                self.heroImagieView.alpha = 1
                self.heroImagieView.image = UIImage(named: "\(index)")!
            }
        }
    }
}
