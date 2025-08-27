import UIKit

final class HomeViewController: UIViewController {
    enum Event {
        case pushTestVC
    }
    var didSendEventHandler: ((Event) -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Home Screen"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 150, width: 200, height: 50)
        button.setTitle("Tap me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - private methods
private extension HomeViewController {
    func setupUI() {
        view.backgroundColor = .systemGreen
        titleLabel.frame = view.bounds
        view.addSubview(titleLabel)
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        didSendEventHandler?(.pushTestVC)
    }
}
