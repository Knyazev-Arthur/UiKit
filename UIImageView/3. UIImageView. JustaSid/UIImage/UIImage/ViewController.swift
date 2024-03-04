import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        imageView.layer.cornerRadius = 10 // округление углов рамки
        imageView.layer.borderWidth = 2 // добавление обводки рамки
        imageView.layer.backgroundColor = UIColor.lightGray.cgColor // установка цвета рамки
    
        // задаем изображение для
        // let image = UIImage(named: "2")! // замена загруженных картинок
        // let image = UIImage(systemName: "sunrise") // установка системного изображения
        
        // загрузка изображения из интернета
        //let imageURL = URL(string: "https://w.forfun.com/fetch/11/11a6b9d00ef914bdb1e69dab65260f57.jpeg")! // инициализируем константу URL
        //let data = try! Data(contentsOf: imageURL) // создаем объект типа Data, который загружает данные с интернета
        //let image = UIImage(data: data)! // преобразуем data в объект UIImage, представляющий изображение
        
        // создаем приложение, содержащее коллекцию изображений, которое позволит анимировано переключать их
        // let image = UIImage.animatedImage(with: [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!], duration: 12)
        
        // способ 2
        imageView.animationDuration = 12 // устанавливаем продолжительность анимации изображения в 12 секунд
        
        guard let imageOne = UIImage(named: "1"), let imageTwo = UIImage(named: "2"), let imageThree = UIImage(named: "3") else { return }
        
        imageView.animationImages = [imageOne, imageTwo, imageThree] // устанавливаем изображения, которые будут использованы в анимации с помощью метода UIImage, позволяющего создавать объект типа UIImage изображения из файла в проекте по его имени
        imageView.startAnimating() // запускаем анимацию изображения
        animation()
        // imageView.image = image // загруженное и созданное изображение присваивается свойству image объекта imageView для отображения его в общей иерархии
    }
    
    //
    /*В этой анимации alpha (прозрачность) изображения imageView изменяется до 0 (полностью прозрачное) в течение 2 секунд с задержкой 2 секунды. Опции .repeat, .autoreverse и .curveEaseIn определяют поведение анимации: .repeat говорит, чтобы анимация повторялась, .autoreverse делает анимацию возвратной (обратно к начальному состоянию), а .curveEaseIn задает плавное ускорение в начале анимации.*/
    func animation() {
        UIView.animate(withDuration: 2, delay: 2, options: [.repeat, .autoreverse, .curveEaseIn], animations: { self.imageView.alpha = 0
        })
    }
}
