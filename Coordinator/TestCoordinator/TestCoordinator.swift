final class TestCoordinator {
    var type: CoordinatorType { .test }
    var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = []
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    deinit {
        print("TestCoordinator deinitialized")
    }
}

extension TestCoordinator: Coordinator {
    func start() {
        
    }
}
