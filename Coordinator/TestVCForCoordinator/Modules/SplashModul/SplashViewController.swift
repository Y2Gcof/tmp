import UIKit

final class SplashViewController: UIViewController {
    enum Event {
        case launchCompleted
    }
    var didSendEventHandler: ((Event) -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Splash Screen"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        animationEvent()
    }
    
    deinit {
        print("SplashViewController deinitialized")
    }
}

// MARK: - private methods
private extension SplashViewController {
    func setupUI() {
        view.backgroundColor = .systemBlue
        titleLabel.frame = view.bounds
        view.addSubview(titleLabel)
    }
    
    func animationEvent() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.didSendEventHandler?(.launchCompleted)
        }
    }
}
