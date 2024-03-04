import UIKit
// в реализации нашей программы ViewController назначен делегатом UIPickerView, расположенного в storyboard
class ViewController: UIViewController {
    
    var picker = UIPickerView() // объявляем экземпляр класса UIPickerView для использования выпадающего списка в нашем приложении
    var imageView = UIImageView() // объявляем экземпляр класса UIImageView для отображения изображение на устройстве
    var label = UILabel() // объявляем экземпляр класса UILabel для использования заголовка на экране
    
    // объявляем и инициализируем массив для компонентов UIPicker
    let universe = ["MARVEL", "DC"]
    // объявляем и инициализируем массив для выбора картинок
    let dcPerson = ["аквамен", "бэтмэн", "супермэн", "чудо-женщина"]
    let marvelPerson = ["чел-пук", "доктор стрэндж", "халк", "железный членовек"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(picker) // добавляем выпадающий список на главное представление
        picker.center.x = view.center.x // размещаем выпадающий список по центру по оси х
        picker.center.y = view.center.y + 200 // размещаем выпадающий список по центру по оси у, но ниже на 200 точек
        picker.delegate = self // устанавливаем текущий экземпляр класса ViewController в качестве делегата picker, что позволяет контроллеру обрабатывать события, связанные с UIPickerView.
        picker.dataSource = self // устанавливаем текущий экземпляр класса ViewController в качестве источника данных (dataSource) picker, чтобы он мог получать данные для отображения в списке.
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: view.frame.width - 50, height: view.frame.height / 2)) // устанавливаем размеры поля для изображений
        view.addSubview(imageView) // добавление поля на главное представление
        imageView.center.x = view.center.x // устанавливаем горизонтальную позицию поля по середине главного представления
        imageView.contentMode = .scaleAspectFill // устанавливаем режим заполнения содержимого imageView, чтобы изображение заполняло поле пропорционально сохраняя соотношение сторон.
        
        imageView.layer.shadowColor = UIColor.red.cgColor // цвет тени для поля imageView
        imageView.layer.shadowOffset = CGSize(width: 0, height: 1) // смещение тени для поля imageView
        imageView.layer.shadowRadius = 10 // радиус размытия тени
        imageView.layer.shadowOpacity = 15 // прозрачность тени
        
        label = UILabel(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: 50)) // устанавливаем размеры для вывески
        view.addSubview(label) // добавляем вывеску на главный экран
        label.textAlignment = .center // выравнивание текста в вывеске по центру
        label.font = UIFont.systemFont(ofSize: 28) // размер текста вывески
        label.text = "Choose your hero!" // текст вывески
    }
    // принимаем строку name, которая представляет имя изображения. Внутри функции используется UIImage(named: name) для загрузки изображения из ресурсов проекта с указанным именем. Если изображение не найдено, оператор guard let прерывает выполнение функции. В противном случае, найденное изображение устанавливается в качестве содержимого imageView.
    func setImagie(name: String) {
        guard let newImage = UIImage(named: name) else { return }
        imageView.image = newImage
    }
}

// через расширение класса ViewController подпишемся на протокол UIPickerViewDataSource и UIPickerViewDelegate и с помощью метода numberOfComponents установим количество выпадающих списков
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return universe.count
        } else {
            return dcPerson.count > marvelPerson.count ? marvelPerson.count : dcPerson.count
        }
    }
}
 
//  метод определяет количество строк в каждом компоненте (столбце) UIPickerView. Если component равен 0, возвращается количество элементов в массиве universe. В противном случае, возвращается количество элементов в массиве, который содержит меньше элементов между dcPerson и marvelPerson.
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return universe[row]
        } else {
            if pickerView.selectedRow(inComponent: 0) == 0 {
                return marvelPerson[row]
            } else {
                return dcPerson[row]
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if component == 0 { // Если выбран первый столбец
                pickerView.reloadComponent(1) // Перезагрузить данные второго столбца, так как они зависят от данных в первом столбце
                
                if pickerView.selectedRow(inComponent: 0) == 0 { // Если в первом списке был выбран первый элемент
                    setImagie(name: marvelPerson[pickerView.selectedRow(inComponent: 1)]) // Установить изображение из массива marvelPerson, взяв индекс из выбранной строки во втором столбце
                } else { // Иначе, если был выбран не первый элемент в первом столбце
                    setImagie(name: dcPerson[pickerView.selectedRow(inComponent: 1)]) // Установить изображение из массива dcPerson, взяв индекс из выбранной строки во втором столбце
                }
            } else { // Если проверка component == 0 не проходит (то есть выбран второй столбец)
                if pickerView.selectedRow(inComponent: 0) == 0 { // Проверяем, был ли выбран первый элемент в первом столбце
                    setImagie(name: marvelPerson[row]) // Установить изображение из массива marvelPerson, взяв индекс из выбранной строки в текущем (втором) столбце
                } else {
                     setImagie(name: dcPerson[row]) // Установить изображение из массива dcPerson, взяв индекс из выбранной строки в текущем (втором) столбце
                }
        }
    }
}
