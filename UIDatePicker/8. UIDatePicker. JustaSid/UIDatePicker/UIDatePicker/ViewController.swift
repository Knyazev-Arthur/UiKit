import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var picker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .dateAndTime
        picker.minuteInterval = 5
    }
    
    @IBAction func pickerAction(_ sender: UIDatePicker) {
        print(sender.date)
        
        let formatter = DateFormatter() // создается экземпляр DateFormatter для форматирования даты
        formatter.dateFormat = "EEEE, MMM d, yyyy HH:mm:ss"
        formatter.timeZone = .current
        print(formatter.string(from: sender.date)) // форматируем выбранную дату из sender.date в строку
    }
    
}
