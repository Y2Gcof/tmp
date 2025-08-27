import UIKit
final class HomeCoordinator {
    var type: CoordinatorType { .homePgae }
    weak var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = []
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
}

extension HomeCoordinator: Coordinator {
    func start() {
        lunchHomePage()
    }
    
    func lunchHomePage() {
        let homeViewController = DependencyFactory.shared.getHomeViewController()
        router.setRootModule(homeViewController, animated: false, hideBar: false)
        homeViewController.didSendEventHandler = { [weak self] event in
            switch event {
            case .pushTestVC:
                self?.getTestCoordinator()
            }
        }
    }
    
    func getTestCoordinator() {
        let testViewController = TestVC()
        testViewController.didSendEventHandler = { [weak self] event in
            switch event {
            case .backToHome:
                self?.router.pop(animated: true)
            }
        }
        router.push(testViewController, animated: true)
    }
}

extension HomeCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        removeChild(childCoordinator)
    }
}
