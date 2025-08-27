// MARK: - Test module get dependency
extension DependencyFactory {
    func createTestViewModel() -> TestViewModel {
        guard let viewModel = container.resolve(TestViewModel.self) else {
            fatalError(Self.createResolveErrorMessage(by: TestViewModel.self))
        }
        
        return viewModel
    }
    
    func getTestVC() -> TestVC {
        getDependency(TestVC.self)//
    }
    
    func registerTest() {
        registerTestViewModel()
        
    }
}

// // MARK: - Test module register components
private extension DependencyFactory {
    func registerTestViewModel() {
        container.autoregister(TestViewModel.self, initializer: TestViewModel.init)
            .inObjectScope(.weak)
        
//        container.register(TestViewModel.self) { resolver in
//            guard let service = resolver.resolve(AuthServicing.self) else {
//                fatalError(Self.createResolveErrorMessage(by: AuthServicing.self))
//            }
//            
//            return TestViewModel(service: service)
//        }
//            .inObjectScope(.weak)
    }
    
    func registerTestVC() {
        container.autoregister(TestVC.self, initializer: TestVC.init)
            .inObjectScope(.transient)
    }
}

class TestViewModel {
    let service: AuthServicing
    
    init(service: AuthServicing) {
        self.service = service
    }
}
