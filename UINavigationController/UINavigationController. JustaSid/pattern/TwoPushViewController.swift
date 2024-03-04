import UIKit

class TwoPushViewController: UIViewController {

    let pushButton = UIButton()
    let popToRootButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        configurePopToRootButton()
        configurePushButton()
        title = "TwoPushViewController"
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
            let controller = PresentedViewController()
            navigationController?.viewControllers.append(controller)
        }
    
    private func configurePopToRootButton() {
        view.addSubview(popToRootButton)
            
        popToRootButton.translatesAutoresizingMaskIntoConstraints = false
            
        let centerX = popToRootButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let centerY = popToRootButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40)
        let width = popToRootButton.widthAnchor.constraint(equalToConstant: 200)
        let height = popToRootButton.heightAnchor.constraint(equalToConstant: 60)
            
        NSLayoutConstraint.activate([centerX, centerY, width, height])
            
        popToRootButton.makeMePopToRoot()
        popToRootButton.addTarget(self, action: #selector(popToRootButtonAction), for: .touchUpInside)
    }
        
    @objc private func popToRootButtonAction() {
        navigationController?.popToRootViewController(animated: true) // метод popToRootViewController позволяет перейти к корневому контроллеру
    }
}
