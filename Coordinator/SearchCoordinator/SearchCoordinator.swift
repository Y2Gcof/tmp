final class SearchCoordinator {
    var type: CoordinatorType { .search }
    var finishDelegate: (any CoordinatorFinishDelegate)?
    var childCoordinators: [Coordinator] = []
    var router: any Router
    
    init(router: Router) {
        self.router = router
    }
}

extension SearchCoordinator: Coordinator {
    func start() {
        let searchViewController = DependencyFactory.shared.getSearchViewController()
        router.setRootModule(searchViewController, animated: false, hideBar: false)
    }
}
