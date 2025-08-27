// MARK: - Home Module get dependency
extension DependencyFactory {
    func getHomeViewController() -> HomeViewController {
        getDependency(HomeViewController.self)
    }
    
    func registerHome() {
        registerHomeCoordinatorComponents()
        registerHomeViewController()
    }
}

// MARK: - Home Module register components
private extension DependencyFactory {
    func registerHomeViewController() {
        container.autoregister(HomeViewController.self, initializer: {HomeViewController()})
            .inObjectScope(.container)
    }
}
