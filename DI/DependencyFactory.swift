import Swinject
import os

final class DependencyFactory {
    static let shared = DependencyFactory()
    let container = Container()
    
    private init() {
        /// Coordinator Base
        registrationRouter()
        registerAppCoordinator()
        registerAppCoordinatorComponents()
        registerComponentSignInViewModel()
        registerTabBarCoordinatorComponents()
        
        /// Register Modules
        registerHome()
        registerTest()
        registerSearch()
        registerFavorites()
        registerProfile()
        registrAuthService()
        
    }
}

// MARK: - Saftey get dependency
extension DependencyFactory {
    func getDependency<Dependency>(_ dependencyType: Dependency.Type, registrationName: RegistrationName? = nil ) -> Dependency {
        guard let dependency = self.container.synchronize().resolve(dependencyType, name: registrationName?.rawValue) else {
            fatalError(DependencyFactory.createResolveErrorMessage(by: dependencyType))
        }
        return dependency
    }
}

// MARK: - Check Dependency
extension DependencyFactory {
    static func createResolveErrorMessage<T>(by type: T.Type) -> String {
        "DependencyFactory -> \(String(describing: type)) resolve error!"
    }
}

private extension DependencyFactory {
    func registrAuthService() {
        container.autoregister(AuthServicing.self, initializer: FirebaseAuthService.init)
            .inObjectScope(.weak)
    }
}
