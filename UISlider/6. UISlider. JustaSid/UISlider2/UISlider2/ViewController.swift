import UIKit

class ViewController: UIViewController {
    
    // создаем оутлета(связи) для взаимодействия с элементами главного представления
    @IBOutlet weak var commonAmoutLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var amoutSlider: UISlider!
    @IBOutlet weak var periodSlider: UISlider!
    @IBOutlet weak var percentSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // добавляем начальный текст для элементов главного представления
        amountLabel.text = "10 000 руб."
        periodLabel.text = "5 мес."
        percentLabel.text = "5 %"
    }
    
    // Когда метод вызывается в ответ на действие пользователя (например, когда пользователь изменяет значение слайдера), система автоматически передает объект, который инициировал это действие в качестве аргумента
    @IBAction func amountSliderAction(_ sender: UISlider) {
        // слайдер будет выбран в зависимости от его тега, установленного нами через storyboard. sender.value - числовое значение, представляющее позицию ползунка слайдера в его диапазоне значений.
        switch sender.tag {
        case 0: amountLabel.text = "\(Int(sender.value)) р."
        case 1: periodLabel.text = "\(Int(sender.value)) мес."
        case 2: percentLabel.text = "\(Int(sender.value)) %"
        default: break
        }
        // вызов функции расчитывающей сумму в зависимости от изменения того или иного ползунка слайдера
        setCommonAmout()
    }
    
    func setCommonAmout() {
        // высчитываем сумму дохода за 1 месяц = сумма / 100 * установленный % / 12
        let percentAmout = amoutSlider.value / 100 * percentSlider.value / 12
        // высчитываем полученный доход = период период времени умножаем на сумму дохода за 1 месяц
        let periodAmout = percentAmout * periodSlider.value
        // итоговая сумма = установленная сумму + полученный доход
        commonAmoutLabel.text = "\(amoutSlider.value + periodAmout) р."
    }
}
