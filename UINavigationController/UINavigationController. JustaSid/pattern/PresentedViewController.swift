import UIKit

class PresentedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        let label = UILabel(frame: .init(origin: .init(x: 60, y: 100), size: .init(width: 300, height: 300)))
        view.addSubview(label)
        label.text = "I'am presented ViewController"
    }
    
}
