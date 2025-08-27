import Swinject
import Foundation

final class AppCoordinator: Coordinator {
    var type: CoordinatorType { .app }
    weak var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = []
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
}

// MARK: - AppCoordinator
extension AppCoordinator {
    func start() {
        showAuthFlow()
    }
    
    func showLunchFlow() {
        let splashCoordinator = DependencyFactory.shared.getSplashScreenCoordinator()
        splashCoordinator.finishDelegate = self
        addChild(splashCoordinator)
        splashCoordinator.start()
    }
    
    func showAuthFlow() {
        let signInCoordinator = DependencyFactory.shared.getSignInScreenCoordinator()
        signInCoordinator.finishDelegate = self
        addChild(signInCoordinator)
        signInCoordinator.start()
    }

    func showOnboardingFlow() {
        // 1. Создать экземпляр OnboardingCoordinator (через DI).
        // 2. Назначить текущий координатор в качестве finishDelegate для OnboardingCoordinator.
        // 3. Добавить OnboardingCoordinator в массив дочерних координаторов.
        // 4. Вызвать метод start() на OnboardingCoordinator, чтобы запустить процесс онбординга.
    }
    
    func showMainFlow() {
        let tabBarCoordinator = DependencyFactory.shared.getTabBarCoordinator()
        tabBarCoordinator.finishDelegate = self
        addChild(tabBarCoordinator)
        tabBarCoordinator.start()
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
            removeChild(childCoordinator)
            switch childCoordinator.type {
            case .launch:
                showMainFlow()
            case .onboarding: break
            case .auth:
                showMainFlow()
            default:
                break
            }
        }
}
