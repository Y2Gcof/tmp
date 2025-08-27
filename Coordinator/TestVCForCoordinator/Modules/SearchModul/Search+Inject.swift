// MARK: - Search Modul get dependency
extension DependencyFactory {
    func getSearchViewController() -> SearchViewControllerTest {
        getDependency(SearchViewControllerTest.self)
    }
    
    func registerSearch() {
        registerSearchCoordinatorComponents()
        registerSearchViewController()
    }
}
// MARK: - Search modul register components
private extension DependencyFactory {
    func registerSearchViewController() {
        container.autoregister(SearchViewControllerTest.self, initializer: {
            SearchViewControllerTest()
        })
        .inObjectScope(.transient)
    }
}
