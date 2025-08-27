import UIKit

// MARK: - DependencyFactory + Router Injection
extension DependencyFactory {
    func registrationRouter() {
        registrationUINavigationController()
        print("registrationRouter Success")
        registerRouter()
    }
    
    func getRouter() -> Router {
        getDependency(Router.self)
    }
    
    func getmainNavigationController() -> UINavigationController? {
        getDependency(UINavigationController.self)
    }
}

// MARK: - Private Methods
private extension DependencyFactory {
    func registerRouter() {
        container.autoregister(Router.self, initializer: DefaultRouter.init).inObjectScope(.container)
    }
    
    func registrationUINavigationController() {
        container.autoregister(UINavigationController.self, initializer:{
            UINavigationController()
        }).inObjectScope(.container)
    }
}
