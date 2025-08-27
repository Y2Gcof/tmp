// MARK: - Profile Module get dependency
extension DependencyFactory {
    func getProfileViewController() -> ProfileViewController {
        getDependency(ProfileViewController.self)
    }
    
    func registerProfile() {
        registerProfileCoordinatorComponents()
        registerProfileViewController()
    }
}

// MARK: - Profile module register components
private extension DependencyFactory {
    func registerProfileViewController() {
        container.autoregister(ProfileViewController.self, initializer: {
            ProfileViewController()
        })
        .inObjectScope(.container)
    }
}
