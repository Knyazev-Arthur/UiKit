import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var someSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(someSwitch.isOn)
        
        someSwitch.isOn = false
        print(someSwitch.isOn)
    }
    // параметр animated указывает, должно ли появление происходить с анимацией
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        sleep(1)
        //someSwitch.isOn = true
        someSwitch.setOn(true, animated: true) // переключатель изменит своё состояние с анимацией, если это возможно
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        print("switch changed")
    }
}

