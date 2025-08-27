/*
    // Пример инъекции зависимостей в модуль SplashScreen
    // SplashScreen+Inject
    extension DependencyFactory{
        func getSplashScreenViewController() -> SplashViewController?{
            getDependency(dependencyType: SplashViewController.self)
        }
        // VM и тд
        
        func registerSplashScreen(){
            registerSplashScreenViewController()
        }
    }

    private extension DependencyFactory{
        func registerSplashScreenViewController(){
            container.autoregister(SplashViewController.self, initializer: SplashViewController.init)
                .inObjectScope(.container)
        }
    }
*/

// в проекте Сани такие файлы создавались в модулях
// |Home/
// |// VM
// |// View и тд
// |// Home+Inject.swift
