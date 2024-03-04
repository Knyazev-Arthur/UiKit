import UIKit

class ViewController: UIViewController {
    
    private let userProfileView: UserProfileView = UserProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userProfileView)
        setupUserProfileViewConstraints()
        keyboardWatchers() // логика реакций приложения на появление и скрытие клавиатуры
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event) //
        /* перед внесением изменений в метод вызываем родительский метод для корректной работы программы */
        self.view.endEditing(true) // скрытие клавиатуры для любого объекта
        // userProfileView.textView.resignFirstResponder() // скрытие клавиатуры для конкретного объекта
    }

    private func setupUserProfileViewConstraints() {
        userProfileView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = userProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailing = userProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let top = userProfileView.topAnchor.constraint(equalTo: view.topAnchor)
        let bottom = userProfileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }
    
    private func keyboardWatchers() {
        // регистрация наблюдателя появления клавиатуры
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        // регистрация наблюдателя скрытия клавиатуры
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    // объявление метода, вызываемого при срабатывании наблюдателя
    @objc private func updateTextView(notification: Notification) { //
        /* извлекаем словарь userIfo, содержащий информацию о клавиатуре, в т.ч. о ее размерах, которые нежны на определения расстояния, на которое потребуется поднять текст для того, чтобы его не перекрыла клавиатура */
        
        let textView = userProfileView.textView
        let textViewBottomConstraint = userProfileView.textViewBottomConstraint.constant
        
        guard let userInfo = notification.userInfo as? [String : Any], //
        /* приводим тип словаря ([AnyHashable : Any]?) типу [String : Any]?, т.к. размер клавиатуры будет извлечен по ключу, который должен иметь текстовое значение */
            let keybordFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue //
        /* инициализируем константе извлеченные данные о размере клавиатуры */
            else { return }
        
        if notification.name == UIResponder.keyboardWillHideNotification { // если полученно уведомление о скрытии клавиатуры
            textView.contentInset = UIEdgeInsets.zero //
            /* возвращаем поднятый над клавиатурой текст на изначальную позицию (обнуялем размер на который поднимали текст) */
        } else { // если клавиатура появляется
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keybordFrame.height + textViewBottomConstraint, right: 0) // поднимаем текст
            textView.scrollIndicatorInsets = textView.contentInset // поднимаем индикатор прокрутки
        }
        
        textView.scrollRangeToVisible(textView.selectedRange) // определяем зону скроллинга
    }
}
