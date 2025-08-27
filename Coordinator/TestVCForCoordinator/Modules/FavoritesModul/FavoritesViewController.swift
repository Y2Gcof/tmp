import UIKit

final class FavoritesViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Favorites Screen"
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
private extension FavoritesViewController {
    func setupUI() {
        view.backgroundColor = .systemRed
        titleLabel.frame = view.bounds
        view.addSubview(titleLabel)
    }
}
