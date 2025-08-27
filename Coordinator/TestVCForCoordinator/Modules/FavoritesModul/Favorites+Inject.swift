// MARK: - Favorites Module get dependency
extension DependencyFactory {
    func getFavoritesViewController() -> FavoritesViewController {
        getDependency(FavoritesViewController.self)
    }
    
    func registerFavorites() {
        registerFavoritesCoordinatorComponents()
        registerFavoritesViewController()
    }
}

// MARK: - Favorites module register components
private extension DependencyFactory {
    func registerFavoritesViewController() {
        container.autoregister(FavoritesViewController.self, initializer: {
            FavoritesViewController()
        })
        .inObjectScope(.transient)
    }
}
