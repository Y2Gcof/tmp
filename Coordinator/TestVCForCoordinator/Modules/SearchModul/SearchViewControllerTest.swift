import UIKit

final class SearchViewControllerTest: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Search Screen"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - private methods
private extension SearchViewControllerTest {
    func setupUI() {
        view.backgroundColor = .systemYellow
        titleLabel.frame = view.bounds
        view.addSubview(titleLabel)
    }
}
