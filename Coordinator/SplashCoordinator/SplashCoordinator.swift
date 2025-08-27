import UIKit
import Swinject

final class SplashCoordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    let router: Router
    
    var type: CoordinatorType { .launch }
    var childCoordinators: [Coordinator] = []
    var onFinish: (() -> ())?
    
    init(router: Router) {
        self.router = router
    }
}

extension SplashCoordinator: Coordinator {
    func start() {
        let splashVC = SplashViewController()
//        DependencyFactory.shared.getSplashScreenViewController()
        
        splashVC.didSendEventHandler = { [weak self] event in
            switch event {
            case .launchCompleted:
                self?.finish()
            }
        }
        
        router.setRootModule(splashVC, animated: true, hideBar: true)
    }
    
    private func showSignIn() {
        let signInCoordinator = SignInCoordinator(router: router)
        
        addChild(signInCoordinator)
        
        signInCoordinator.start()
    }
}
