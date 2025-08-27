final class FavoritesCoordinator {
    var type: CoordinatorType { .favorite }
    var finishDelegate: (any CoordinatorFinishDelegate)?
    var childCoordinators: [Coordinator] = []
    var router: Router
    
    init(router:Router) {
        self.router = router
    }
}

extension FavoritesCoordinator: Coordinator {
    func start() {
        let favoritesViewController = DependencyFactory.shared.getFavoritesViewController()
        router.setRootModule(favoritesViewController, animated: false, hideBar: false)
    }
}
