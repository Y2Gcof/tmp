extension DependencyFactory {
    func registerHomeCoordinatorComponents() {
        registerTestCoordinator()
    }
}

extension DependencyFactory {
    func getTestCoordinator() -> Coordinator {
        getDependency(TestCoordinator.self)
    }
}

private extension DependencyFactory {
    func registerTestCoordinator() {
        container.autoregister(TestCoordinator.self, initializer: {
            TestCoordinator(router: DependencyFactory.shared.getHomeRouter())
        })
        .inObjectScope(.transient)
    }
}
