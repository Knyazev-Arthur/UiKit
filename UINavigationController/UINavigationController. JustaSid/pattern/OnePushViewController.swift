import UIKit

class OnePushViewController: UIViewController {
    
    let pushButton = UIButton()
    let popButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        configurePushButton()
        configurePopButton()
        title = "OnePushViewController"
//        navigationItem.hidesBackButton = true // откл отображение кнопки на текущем vc
    }
        
    private func configurePushButton() {
        view.addSubview(pushButton)
            
        pushButton.translatesAutoresizingMaskIntoConstraints = false
            
        let centerX = pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let centerY = pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40)
        let width = pushButton.widthAnchor.constraint(equalToConstant: 200)
        let height = pushButton.heightAnchor.constraint(equalToConstant: 60)
            
        NSLayoutConstraint.activate([centerX, centerY, width, height])
            
        pushButton.makeMePushButton()
        pushButton.addTarget(self, action: #selector(pushButtonAction), for: .touchUpInside)
    }
        
    @objc private func pushButtonAction() {
        let controller = TwoPushViewController()
//        navigationController?.pushViewController(controller, animated: true)
        navigationController?.viewControllers.append(controller) // взаимодействие со стеком напрямую(пропадает плавность - анимация)
    }
    
    private func configurePopButton() {
        view.addSubview(popButton)
            
        popButton.translatesAutoresizingMaskIntoConstraints = false
            
        let centerX = popButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let centerY = popButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40)
        let width = popButton.widthAnchor.constraint(equalToConstant: 200)
        let height = popButton.heightAnchor.constraint(equalToConstant: 60)
            
        NSLayoutConstraint.activate([centerX, centerY, width, height])
            
        popButton.makeMePopButton()
        popButton.addTarget(self, action: #selector(popButtonAction), for: .touchUpInside)
    }
        
    @objc private func popButtonAction() {
//        navigationController?.popViewController(animated: true)
        navigationController?.viewControllers.removeLast() // удаление последнего элемента(контроллера) из стека
    }

}
