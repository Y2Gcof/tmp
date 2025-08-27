import UIKit

final class TestVC: UIViewController {
    enum Event {
        case backToHome
    }
    
//    let viewModel: TestViewModel
    var didSendEventHandler: ((Event) -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private let customBackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 300, y: 300, width: 100, height: 100)
        button.setTitle("Tap me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    init() {
//        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func backButtonTapped() {
        print("backButtonTapped")
        didSendEventHandler?(.backToHome)
    }
    
    deinit {
        print("TestVC deinitialized")
    }
}

private extension TestVC {
    func setupUI() {
        view.backgroundColor = .systemOrange
        titleLabel.frame = view.bounds
        view.addSubview(titleLabel)
        view.addSubview(customBackButton)
        customBackButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
}
