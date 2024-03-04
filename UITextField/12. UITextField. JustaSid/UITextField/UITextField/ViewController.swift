import UIKit

class ViewController: UIViewController {
    
    // Элементы
    @IBOutlet weak var login: UITextField! // связь для взаимодействия с элементом сториборда
    private var password = UITextField()
    private var validator = Validator()
    private var storage = Storage.initial
    
    // Настройки экрана
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(password)
        // связываем login и password с ViewController и делегируем управление этими текстовыми полями самому ViewController
        login.delegate = self
        password.delegate = self
        
        setupPasswordConstraints()
        setupPassword()
    }
    
    // Размещение password
    private func setupPasswordConstraints() {
        password.translatesAutoresizingMaskIntoConstraints = false
    
        let top = password.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 32)
        let leading = password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let railing = password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    
        let items = [top,leading,railing]
        NSLayoutConstraint.activate(items)
    }
    
    // Конфигурации password
    private func setupPassword() {
        password.borderStyle = .roundedRect // устанавливаем закругленную рамку
        password.placeholder = "enter password" // устанавливаем текст placeholder
        password.isSecureTextEntry = true // откл отображения символов при вводе
        // password.keyboardType = .phonePad // устанавливаем лишь цифровую клавиатуру
        password.keyboardAppearance = .dark // отображение клавиатуры в темном виде
        password.clearButtonMode = .always // отображение кнопки отчистки текстового поля - всегда
    }
}

// подписываемся на протокол UITextFieldDelegate через расширение
extension ViewController: UITextFieldDelegate {
    
    // метод для обработки события нажатия на клавишу "Return" на клавиатуре
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // возвращаемое значение Bool указывает, должна ли клавиатура закрыться после нажатия на "Return"
        if textField == login {
            password.becomeFirstResponder() // делаем поле пароля активным, переводя на него курсор
        } else {
            textField.becomeFirstResponder() // курсор останется в текущем текстовом поле
        }
        return true // клавиатура должна закрыться после нажатия на "Return"
    }
    
    // метод вызывается перед изменением текста в UITextField. Позволяет проверить предлагаемое изменение и решить, следует ли его применить
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField { // проверяем к какому текстовому полю пренадлежит ввод
        case login: break
        case password: return validator.husNumbers(text: string) // проверяем, содержит ли вставленная строка цифру из заданного списка чисел. Если содержит, возвращает true, что позволяет вставить эту строку в поле пароля.
        default: break
        }
        return true
    }
    
    // метод для очистки поля только в случае его редактирования
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField.isEditing { // если поле сейчас редактируется
            return true
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == login {
            storage.login = textField.text!
        } else {
            storage.password = textField.text!
            print(storage.login, storage.password)
        }
    }
}

struct Validator {
    let numbers = "1234567890"
    
    func husNumbers(text: String) -> Bool {
        for number in numbers {
            if text.contains(number) {
                return true
            }
        }
        return false
    }
}

struct Storage {
    var login = ""
    var password = ""
    
    static let initial = Storage()
}
