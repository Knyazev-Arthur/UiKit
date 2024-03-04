import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var textViewDelegate: TextViewDelegateProtocol { get set }
}
class UserProfileView: UIView, UserProfileViewProtocol {
    
    var textViewDelegate: TextViewDelegateProtocol

    private let textView: UITextView
    
    init() {
        self.textView = UITextView()
        self.textViewDelegate = TextViewDelegate()
        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // переопределение метода, отслеживающего касания
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder() // скрытие клавиатуры при касании любой области, кроме textView, перехватывающим событие касания
//        textView.backgroundColor = .red
    }

}

private extension UserProfileView {
    
    func setupUserProfileView() {
        backgroundColor = .red
        
        setupTextView()
        addSubview(textView)
        setupTextViewContraints()
        setupNotificationCenterField()
    }
    
    func setupTextView() {
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.backgroundColor = UIColor(ciColor: .cyan)
        textView.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10) // отступы размещения текста
        textView.layer.cornerRadius = 8
    }
    
    func setupTextViewContraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = textView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leading = textView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailing = textView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let height = textView.heightAnchor.constraint(equalToConstant: 500)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupNotificationCenterField() {
        // Добавление наблюдателя для уведомления о показе клавиатуры
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView),
                                               name: UITextView.keyboardDidShowNotification,
                                               object: nil)
        // Добавление наблюдателя для уведомления о скрытии клавиатуры
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView),
                                               name: UITextView.keyboardWillHideNotification,
                                               object: nil)
    }

    @objc func updateTextView(param: Notification) {
        let userInfo = param.userInfo // param.userInfo представляет собой словарь ([AnyHashable: Any]?), содержащий дополнительные данные, переданные вместе с уведомлением о скрытие/появлении клавиатуры. Здесь используется для извлечения информации о размерах клавиатуры.
        guard let getLeyboardRect = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return } // получаем значение из словаря по ключу UIResponder.keyboardFrameEndUserInfoKey. Ключ связан с информацией о прямоугольной области клавиатуры. Далее преобразовываем значение к типу NSValue, так как размер клавиатуры может быть представлен в этом формате и получаем получить прямоугольное значение из NSValue
        let keyboardFrame = self.convert(getLeyboardRect, to: self.window) // преобразуем координаты прямоугольной области клавиатуры из координат UserProfileView в координаты окна. Это необходимо, потому что разные представления (view) могут иметь разные системы координат, и для корректного использования размеров клавиатуры вам нужно привести их к общей системе координат.
        
        if param.name == UIResponder.keyboardWillHideNotification { // проверяем, является ли уведомление о том, что клавиатура будет скрыта.
            textView.contentInset = .zero // устанавливаем contentInset для UITextView в .zero (без отступов), так как клавиатура больше не перекрывает текст.
        } else {
            textView.contentInset = .init(top: 10, left: 10, bottom: keyboardFrame.height, right: 10) // отступ снизу устанавливается равным высоте клавиатуры (keyboardFrame.height). Это делается для того, чтобы текст в UITextView не был перекрыт клавиатурой при ее появлении.
            textView.scrollIndicatorInsets = textView.contentInset // устанавливаем scrollIndicatorInsets для UITextView. scrollIndicatorInsets определяет отступы индикатора прокрутки от краев вьюхи. В данном случае, эти отступы устанавливаются такими же, как и contentInset. Это сделано для того, чтобы индикатор прокрутки также отображался с учетом отступов от клавиатуры, так чтобы пользователь мог видеть, насколько можно прокрутить текст.
        }
        textView.scrollRangeToVisible(textView.selectedRange) // Эта строка прокручивает текстовое поле так, чтобы текущий выделенный текст (если есть) был виден пользователю.
    }
    
}
