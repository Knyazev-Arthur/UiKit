import UIKit

class ViewController: UIViewController {
    
    private let pushButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurePushButton()
        configureBackButtonItem()
        title = "ViewController"
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
//        let controller = PresentedViewController()
//        present(controller, animated: true, completion: nil)
        let controller = OnePushViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func configureBackButtonItem() {
        // инициализация кастомной кнопки назад, что позволит изменить лишь ее название
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "trum",
            style: .plain,
            target: self,
            action: #selector(backAction))
    }
    
    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
}
