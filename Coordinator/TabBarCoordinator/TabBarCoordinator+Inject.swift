import UIKit
// MARK: - тут регистрация 4-х отдельных UINavigationController и 4-х отдельных Router и прокидывание этих зависимостей в 4 кординатора TabBar на регистарацию/создание

// MARK: - TabBarCoordinator
extension DependencyFactory {
    func registerTabBarCoordinatorComponents() {
        registerTabBarCoordinatorNavigationControllers()
        registerTabBarCoordinatorRouters()
        registerTabBarCoordinatorCoordinators()
    }
    
    // MARK: - TabBarCoordinator NavController get
    func getHomeNavigationController() -> UINavigationController {
        getDependency(UINavigationController.self, registrationName: RegistrationName.homeNavigationController)
    }
    
    func getSearchNavigationController() -> UINavigationController {
        getDependency(UINavigationController.self, registrationName: RegistrationName.searchNavigationController)
    }
    
    func getFavoritesNavigationController() -> UINavigationController {
        getDependency(UINavigationController.self, registrationName: RegistrationName.favoritesNavigationController)
    }
    
    func getProfileNavigationController() -> UINavigationController {
        getDependency(UINavigationController.self, registrationName: RegistrationName.profileNavigationController)
    }
    
    // MARK: - TabBarCoordinator DefaultRouter get
    func getHomeRouter() -> Router {
        getDependency(Router.self, registrationName: RegistrationName.homeRouter)
    }

    func getSearchRouter() -> Router {
        getDependency(Router.self, registrationName: RegistrationName.searchRouter)
    }

    func getFavoritesRouter() -> Router {
        getDependency(Router.self, registrationName: RegistrationName.favoritesRouter)
    }

    func getProfileRouter() -> Router {
        getDependency(Router.self, registrationName: RegistrationName.profileRouter)
    }
    
    // MARK: - TabBarCoordinator DefaultRouter get
    func getHomeCoordinator() -> Coordinator {
        getDependency(HomeCoordinator.self)
    }
    
    func getSearchCoordinator() -> Coordinator {
        getDependency(SearchCoordinator.self)
    }
    
    func getFavoritesCoordinator() -> Coordinator {
        getDependency(FavoritesCoordinator.self)
    }
    
    func getProfileCoordinator() -> Coordinator {
        getDependency(ProfileCoordinator.self)
    }
}

// MARK: - TabBarCoordinator Register
private extension DependencyFactory {
    func registerTabBarCoordinatorNavigationControllers() {
        registretionHomeNavigationController()
        registretionSearchNavigationController()
        registretionFavoritesNavigationController()
        registretionProfileNavigationController()
    }
    
    func registerTabBarCoordinatorRouters() {
        registretionHomeRouter()
        registretionSearchRouter()
        registretionFavoritesRouter()
        registretionProfileRouter()
    }
    
    func registerTabBarCoordinatorCoordinators() {
        registretionHomeCoordinator()
        registretionSearchCoordinator()
        registretionFavoritesCoordinator()
        registretionProfileCoordinator()
    }
    
    // MARK: - TabBarCoordinator NavContrller registration/get
    // MARK: - TabBarCoordinator NavContrller registration
    func registretionHomeNavigationController() {
        container.autoregister(UINavigationController.self, registrationName: RegistrationName.homeNavigationController, initializer: {
            UINavigationController()
        })
        .inObjectScope(.container)
    }
    
    func registretionSearchNavigationController() {
        container.autoregister(UINavigationController.self, registrationName: RegistrationName.searchNavigationController, initializer: {
            UINavigationController()
        })
        .inObjectScope(.container)
    }
    
    func registretionFavoritesNavigationController() {
        container.autoregister(UINavigationController.self, registrationName: RegistrationName.favoritesNavigationController, initializer: {
            UINavigationController()
        })
        .inObjectScope(.container)
    }
    
    func registretionProfileNavigationController() {
        container.autoregister(UINavigationController.self, registrationName: RegistrationName.profileNavigationController, initializer: {
            UINavigationController()
        })
        .inObjectScope(.container)
    }
    
    // MARK: - TabBarCoordinator DefaultRouter registration/get
    // MARK: - TabBarCoordinator DefaultRouter registration
    
    func registretionHomeRouter() {
        container.autoregister(Router.self, registrationName: RegistrationName.homeRouter, initializer: { [weak self] in
            guard let homeNavigationController = self?.getHomeNavigationController() else { fatalError("DependecyFactory: HomeNavigationController is nil") }
            return DefaultRouter(navigationController: homeNavigationController)
        })
        .inObjectScope(.container)
    }
    
    func registretionSearchRouter() {
        container.autoregister(Router.self, registrationName: RegistrationName.searchRouter, initializer: { [weak self] in
            guard let searchNavigationController = self?.getSearchNavigationController() else { fatalError("DependecyFactory: SearchNavigationController is nil") }
            return DefaultRouter(navigationController: searchNavigationController)
        })
        .inObjectScope(.container)
    }
    
    func registretionFavoritesRouter() {
        container.autoregister(Router.self, registrationName: RegistrationName.favoritesRouter, initializer: { [weak self] in
            guard let favoritesNavigationController = self?.getFavoritesNavigationController() else { fatalError("DependecyFactory: FavoritesNavigationController is nil") }
            return DefaultRouter(navigationController: favoritesNavigationController)
        })
        .inObjectScope(.container)
    }
    
    func registretionProfileRouter() {
        container.autoregister(Router.self, registrationName: RegistrationName.profileRouter, initializer: { [weak self] in
            guard let profileNavigationController = self?.getProfileNavigationController() else { fatalError("DependecyFactory: ProfileNavigationController is nil") }
            return DefaultRouter(navigationController: profileNavigationController)
        })
        .inObjectScope(.container)
    }
    
    // MARK: - TabBarCoordinator Coordinator registration/get
    // MARK: - TabBarCoordinator Coordinator registration
    
    func registretionHomeCoordinator() {
        container.autoregister(HomeCoordinator.self, initializer: { [weak self] in
            guard let homeRouter = self?.getHomeRouter() else { fatalError("DependecyFactory: HomeRouter is nil") }
            return HomeCoordinator(router: homeRouter)
        })
        .inObjectScope(.container)
    }
    
    func registretionSearchCoordinator() {
        container.autoregister(SearchCoordinator.self, initializer: { [weak self] in
            guard let searchRouter = self?.getSearchRouter() else { fatalError("DependecyFactory: SearchRouter is nil") }
            return SearchCoordinator(router: searchRouter)
        })
        .inObjectScope(.container)
    }
    
    func registretionFavoritesCoordinator() {
        container.autoregister(FavoritesCoordinator.self, initializer: { [weak self] in
            guard let favoritesRouter = self?.getFavoritesRouter() else { fatalError("DependecyFactory: FavoritesRouter is nil") }
            return FavoritesCoordinator(router: favoritesRouter)
        })
        .inObjectScope(.container)
    }
    
    func registretionProfileCoordinator() {
        container.autoregister(ProfileCoordinator.self, initializer: { [weak self] in
            guard let profileRouter = self?.getProfileRouter() else { fatalError("DependecyFactory: ProfileRouter is nil") }
            return ProfileCoordinator(router: profileRouter)
        })
        .inObjectScope(.container)
    }
}
