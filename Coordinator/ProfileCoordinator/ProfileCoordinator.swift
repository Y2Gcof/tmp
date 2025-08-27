final class ProfileCoordinator {
    var type: CoordinatorType { .settings }
    var finishDelegate: (any CoordinatorFinishDelegate)?
    var childCoordinators: [Coordinator] = []
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
}

extension ProfileCoordinator: Coordinator {
    func start() {
        let profileViewController = DependencyFactory.shared.getProfileViewController()
        router.setRootModule(profileViewController, animated: false, hideBar: false)
    }
}
