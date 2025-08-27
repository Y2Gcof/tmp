// MARK: - AppCoordinatorComponents
extension DependencyFactory {
    func getSplashScreenCoordinator() -> Coordinator {
        getDependency(SplashCoordinator.self)
    }
    
    func getSignInScreenCoordinator() -> Coordinator {
        getDependency(SignInCoordinator.self)
    }
    
    func getAppCoordinator() -> Coordinator? {
        getDependency(AppCoordinator.self)
    }
    
    func getTabBarCoordinator() -> Coordinator {
        getDependency(TabBarCoordinator.self)
    }
    
    /// register AppCorrdinator and all components for AppCoordinator
    
    func registerAppCoordinatorComponents() {
        registerSplashScreenCoordinator()
        registerTabBarCoordinator()
        registerSignInScreenCoordinator()
    }
    
    func registerAppCoordinator() {
        container.autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
            .inObjectScope(.container)
    }
}

// MARK: - register SplashCoordinator and TabBarCoordinator
private extension DependencyFactory {
    func registerSplashScreenCoordinator() {
        container.autoregister(SplashCoordinator.self, initializer: SplashCoordinator.init)
            .inObjectScope(.transient)
    }
    
    func registerSignInScreenCoordinator() {
        container.autoregister(SignInCoordinator.self, initializer: SignInCoordinator.init)
            .inObjectScope(.transient)
    }
    
    func registerTabBarCoordinator() {
        container.autoregister(TabBarCoordinator.self, initializer: TabBarCoordinator.init)
            .inObjectScope(.container)
    }
}
