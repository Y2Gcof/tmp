import Swinject

// MARK: - Autoregister
extension Container {
    func autoregister<Dependency>(
        _ dependencyType: Dependency.Type,
        initializer: @escaping () -> Dependency
    ) -> ServiceEntry<Dependency> {
        register(dependencyType.self, factory: { _ in
            initializer()
        } as (Resolver) -> Dependency)
    }
    
    func autoregister<Dependency, A>(
        _ dependencyType: Dependency.Type,
        initializer: @escaping (A) -> Dependency
    ) -> ServiceEntry<Dependency> {
        register(dependencyType.self, factory: { resolver in
            guard let resolver = resolver.resolve(A.self) else {
                fatalError("Unable to resolve dependency A: \(A.self)")
            }
            return initializer(resolver)
        } as (Resolver) -> Dependency)
    }
    
    func autoregister<Dependency, A, B>(
        _ dependencyType: Dependency.Type,
        initializer: @escaping (A, B) -> Dependency
    ) -> ServiceEntry<Dependency> {
        register(dependencyType.self, factory: { resolver in
            guard let resolverA = resolver.resolve(A.self) else {
                fatalError("Unable to resolve dependency A: \(A.self)")
            }
            guard let resolverB = resolver.resolve(B.self) else {
                fatalError("Unable to resolve dependency B: \(B.self)")
            }
            return initializer(resolverA, resolverB)
        } as (Resolver) -> Dependency)
    }
    
    func autoregister<Dependency, A, B, C>(
        _ dependencyType: Dependency.Type,
        initializer: @escaping (A, B, C) -> Dependency
    ) -> ServiceEntry<Dependency> {
        register(dependencyType.self, factory: { resolver in
            guard let resolverA = resolver.resolve(A.self) else {
                fatalError("Unable to resolve dependency A: \(A.self)")
            }
            guard let resolverB = resolver.resolve(B.self) else {
                fatalError("Unable to resolve dependency B: \(B.self)")
            }
            guard let resolverC = resolver.resolve(C.self) else {
                fatalError("Unable to resolve dependency C: \(C.self)")
            }
            return initializer(resolverA, resolverB, resolverC)
        } as (Resolver) -> Dependency)
    }
    
    func autoregister<Dependency, A, B, C, D>(
        _ dependencyType: Dependency.Type,
        initializer: @escaping (A, B, C, D) -> Dependency
    ) -> ServiceEntry<Dependency> {
        register(dependencyType.self, factory: { resolver in
            guard let resolverA = resolver.resolve(A.self) else {
                fatalError("Unable to resolve dependency A: \(A.self)")
            }
            guard let resolverB = resolver.resolve(B.self) else {
                fatalError("Unable to resolve dependency B: \(B.self)")
            }
            guard let resolverC = resolver.resolve(C.self) else {
                fatalError("Unable to resolve dependency C: \(C.self)")
            }
            guard let resolverD = resolver.resolve(D.self) else {
                fatalError("Unable to resolve dependency D: \(D.self)")
            }
            return initializer(resolverA, resolverB, resolverC, resolverD)
        } as (Resolver) -> Dependency)
    }
}

// MARK: - Autoregister with name
extension Container {
    func autoregister<Dependency>(
        _ dependencyType: Dependency.Type,
        registrationName: DependencyFactory.RegistrationName? = nil,
        initializer: @escaping () -> Dependency
    ) -> ServiceEntry<Dependency> {
        register(dependencyType.self, name: registrationName?.rawValue, factory: { _ in
            return initializer()
        } as (Resolver) -> Dependency)
    }
    
    func autoregister<Dependency, A>(
        _ dependencyType: Dependency.Type,
        registrationName: DependencyFactory.RegistrationName? = nil,
        initializer: @escaping (A) -> Dependency
    ) -> ServiceEntry<Dependency> {
        register(dependencyType.self, name: registrationName?.rawValue, factory: { resolver in
            guard let resolver = resolver.resolve(A.self) else {
                fatalError("Unable to resolve dependency A or it's name is not specified: \(A.self)")
            }
            return initializer(resolver)
        } as (Resolver) -> Dependency)
    }
    
    func autoregister<Dependency, A, B>(
        _ dependencyType: Dependency.Type,
        registrationName: DependencyFactory.RegistrationName? = nil,
        initializer: @escaping (A, B) -> Dependency
    ) -> ServiceEntry<Dependency> {
        register(dependencyType.self, name: registrationName?.rawValue, factory: { resolver in
            guard let resolverA = resolver.resolve(A.self) else {
                fatalError("Unable to resolve dependency A or it's name is not specified: \(A.self)")
            }
            guard let resolverB = resolver.resolve(B.self) else {
                fatalError("Unable to resolve dependency B or it's name is not specified: \(B.self)")
            }
            return initializer(resolverA, resolverB)
        } as (Resolver) -> Dependency)
    }
    
    func autoregister<Dependency, A, B, C>(
        _ dependencyType: Dependency.Type,
        registrationName: DependencyFactory.RegistrationName? = nil,
        initializer: @escaping (A, B, C) -> Dependency
    ) -> ServiceEntry<Dependency> {
        register(dependencyType.self, name: registrationName?.rawValue, factory: { resolver in
            guard let resolverA = resolver.resolve(A.self) else {
                fatalError("Unable to resolve dependency A or it's name is not specified: \(A.self)")
            }
            guard let resolverB = resolver.resolve(B.self) else {
                fatalError("Unable to resolve dependency B or it's name is not specified: \(B.self)")
            }
            guard let resolverC = resolver.resolve(C.self) else {
                fatalError("Unable to resolve dependency C or it's name is not specified: \(B.self)")
            }
            return initializer(resolverA, resolverB, resolverC)
        } as (Resolver) -> Dependency)
    }
    
    func autoregister<Dependency, A, B, C, D>(
        _ dependencyType: Dependency.Type,
        registrationName: DependencyFactory.RegistrationName? = nil,
        initializer: @escaping (A, B, C, D) -> Dependency
    ) -> ServiceEntry<Dependency> {
        register(dependencyType.self, name: registrationName?.rawValue, factory: { resolver in
            guard let resolverA = resolver.resolve(A.self) else {
                fatalError("Unable to resolve dependency A or it's name is not specified: \(A.self)")
            }
            guard let resolverB = resolver.resolve(B.self) else {
                fatalError("Unable to resolve dependency B or it's name is not specified: \(B.self)")
            }
            guard let resolverC = resolver.resolve(C.self) else {
                fatalError("Unable to resolve dependency C or it's name is not specified: \(B.self)")
            }
            guard let resolverD = resolver.resolve(D.self) else {
                fatalError("Unable to resolve dependency D or it's name is not specified: \(D.self)")
            }
            return initializer(resolverA, resolverB, resolverC, resolverD)
        } as (Resolver) -> Dependency)
    }
}
