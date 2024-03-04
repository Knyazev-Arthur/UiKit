import UIKit

// MARK: - UserProfileViewProtocol
protocol UserProfileViewProtocol: UIView {
    var pickerViewDataSource: PickerViewDataSourceProtocol { get set }
    var pickerViewDelegate: PickerViewDelegateProtocol { get set }
    var fontArray: [String] { get set }
    var controllerDelegate: ViewController? { get set }
    func fontTextView(_ font: UIFont)
    func currentValueFontSlider() -> CGFloat
}

class UserProfileView: UIView, UserProfileViewProtocol {
    
    weak var controllerDelegate: ViewController?
    var pickerViewDataSource: PickerViewDataSourceProtocol
    var pickerViewDelegate: PickerViewDelegateProtocol
    var fontArray: [String]
    private let textView: UITextView
    private let fontSizeSlider: UISlider
    private let textColorButtonStack: UIStackView
    private let fontStylePicker: UIPickerView
    private let lightingModeSwitch: UISwitch
    private let colorStyleStack: UIStackView
    private let blackTextButton: UIButton
    private let redTextButton: UIButton
    private let greenTextButton: UIButton
    private let blueTextButton: UIButton
    private let shareButton: UIButton
    private var activityViewController: UIActivityViewController
    
    init() {
        self.activityViewController = UIActivityViewController(activityItems: [], applicationActivities: nil)
        self.pickerViewDataSource = PickerViewDataSource()
        self.pickerViewDelegate = PickerViewDelegate()
        self.fontArray = ["Helvetica Neue", "Arial", "Times New Roman", "Courier New"]
        self.textView = UITextView()
        self.fontSizeSlider = UISlider()
        self.textColorButtonStack = UIStackView()
        self.fontStylePicker = UIPickerView()
        self.lightingModeSwitch = UISwitch()
        self.colorStyleStack = UIStackView()
        self.blackTextButton = UIButton()
        self.redTextButton = UIButton()
        self.greenTextButton = UIButton()
        self.blueTextButton = UIButton()
        self.shareButton = UIButton()

        super.init(frame: .zero)
        setupUserProfileView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fontTextView(_ font: UIFont) {
        textView.font = font
    }
    
    func currentValueFontSlider() -> CGFloat {
        CGFloat(fontSizeSlider.value)
    }

}

private extension UserProfileView {
    
    func setupUserProfileView() {
        pickerViewDataSource.userProfileView = self
        pickerViewDelegate.userProfileView = self
        backgroundColor = .red
        
        setupShareButton()
        setupLightingModeSwitch()
        setupTextView()
        setupFontSizeSlider()
        setupColorStyleStack()
        
        addSubview(shareButton)
        addSubview(lightingModeSwitch)
        addSubview(textView)
        addSubview(fontSizeSlider)
        addSubview(colorStyleStack)
        
        setupShareButtonContraints()
        setupLightingModeSwitchContraints()
        setupTextViewContraints()
        setupFontSizeSliderContraints()
        setupColorStyleStackContraints()
    }
    
    func setupShareButton() {
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.addTarget(self, action: #selector(hedleShare), for: .touchUpInside)
    }
    
    @objc func hedleShare() {
        activityViewController = UIActivityViewController(activityItems: [textView.text as Any], applicationActivities: nil)
        controllerDelegate?.present(activityViewController, animated: true, completion: nil)
    }
    
    func setupLightingModeSwitch() {
        lightingModeSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            overrideUserInterfaceStyle = .dark
            backgroundColor = .black
            textView.backgroundColor = .black
        } else {
            overrideUserInterfaceStyle = .light
            backgroundColor = .red
            textView.backgroundColor = .white
        }
    }
    
    func setupTextView() {
        textView.text = "text".textWithdrawal()
        textView.font = .systemFont(ofSize: 12)
        textView.backgroundColor = .white
        textView.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10) // отступы размещения текста
        textView.layer.cornerRadius = 8
    }
    
    func setupFontSizeSlider() {
        fontSizeSlider.minimumValue = 12
        fontSizeSlider.maximumValue = 100
        fontSizeSlider.addTarget(self, action: #selector(fontSizeChanged), for: .valueChanged)
    }
    
    @objc func fontSizeChanged() {
        textView.font = .systemFont(ofSize: (CGFloat(fontSizeSlider.value)))
    }
    
    func setupBlackTextButton() {
        blackTextButton.setupButton()
        blackTextButton.setTitle("Black", for: .normal)
        blackTextButton.backgroundColor = .black
        blackTextButton.addTarget(self, action: #selector(tapColorButton), for: .touchUpInside)
    }
    
    func setupRedTextButton() {
        redTextButton.setupButton()
        redTextButton.setTitle("Red", for: .normal)
        redTextButton.backgroundColor = .red
        redTextButton.addTarget(self, action: #selector(tapColorButton), for: .touchUpInside)
    }
    
    func setupGreenTextButton() {
        greenTextButton.setupButton()
        greenTextButton.setTitle("Green", for: .normal)
        greenTextButton.backgroundColor = .green
        greenTextButton.addTarget(self, action: #selector(tapColorButton), for: .touchUpInside)
    }
    
    func setupBlueTextButton() {
        blueTextButton.setupButton()
        blueTextButton.setTitle("Blue", for: .normal)
        blueTextButton.backgroundColor = .blue
        blueTextButton.addTarget(self, action: #selector(tapColorButton), for: .touchUpInside)
    }
    
    func setupTextColorButtonStack() {
        setupBlackTextButton()
        setupRedTextButton()
        setupGreenTextButton()
        setupBlueTextButton()
        
        textColorButtonStack.distribution = .fillEqually
        textColorButtonStack.axis = .vertical
        textColorButtonStack.spacing = 4
        textColorButtonStack.addArrangedSubview(blackTextButton)
        textColorButtonStack.addArrangedSubview(redTextButton)
        textColorButtonStack.addArrangedSubview(greenTextButton)
        textColorButtonStack.addArrangedSubview(blueTextButton)
    }
    
    @objc func tapColorButton(button: UIButton) {
        button.setupTapButton()
        switch button {
        case blackTextButton:
            textView.textColor = .black
        case redTextButton:
            textView.textColor = .red
        case greenTextButton:
            textView.textColor = .green
        case blueTextButton:
            textView.textColor = .blue
        default:
            break
        }
    }
    
    func setupFontStylePicker() {
        fontStylePicker.delegate = pickerViewDelegate
        fontStylePicker.dataSource = pickerViewDataSource
    }
    
    func setupColorStyleStack() {
        setupTextColorButtonStack()
        setupFontStylePicker()
        
        colorStyleStack.distribution = .fillEqually
        colorStyleStack.axis = .horizontal
        colorStyleStack.spacing = 4
        colorStyleStack.addArrangedSubview(textColorButtonStack)
        colorStyleStack.addArrangedSubview(fontStylePicker)
    }
    
    func setupShareButtonContraints() {
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        let top = shareButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
        let leading = shareButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let height = shareButton.heightAnchor.constraint(equalToConstant: 30)
        let width = shareButton.widthAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, height, width])
    }
    
    func setupLightingModeSwitchContraints() {
        lightingModeSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        let top = lightingModeSwitch.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
        let trailing = lightingModeSwitch.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        
        NSLayoutConstraint.activate([top, trailing])
    }
    
    func setupTextViewContraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = textView.topAnchor.constraint(equalTo: lightingModeSwitch.bottomAnchor, constant: 10)
        let leading = textView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailing = textView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let height = textView.heightAnchor.constraint(equalToConstant: 300)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupFontSizeSliderContraints() {
        fontSizeSlider.translatesAutoresizingMaskIntoConstraints = false
        
        let top = fontSizeSlider.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 16)
        let leading = fontSizeSlider.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailing = fontSizeSlider.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let height = fontSizeSlider.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    func setupColorStyleStackContraints() {
        colorStyleStack.translatesAutoresizingMaskIntoConstraints = false
        
        let top = colorStyleStack.topAnchor.constraint(equalTo: fontSizeSlider.bottomAnchor, constant: 16)
        let leading = colorStyleStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailing = colorStyleStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let height = colorStyleStack.heightAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
}
