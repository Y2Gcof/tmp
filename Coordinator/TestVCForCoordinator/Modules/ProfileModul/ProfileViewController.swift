import UIKit

final class ProfileViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile Screen"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - private methods
private extension ProfileViewController {
    func setupUI() {
        view.backgroundColor = .systemPurple
        titleLabel.frame = view.bounds
        view.addSubview(titleLabel)
    }
}
    
