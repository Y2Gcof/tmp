import UIKit

enum CoordinatorType {
    case app
    case auth
    case launch
    case onboarding
    case tabBar
    case homePgae
    case favorite
    case search
    case settings
    case test
}

// MARK: - Base Coordinator
/// Протокол базового координатора
protocol Coordinator: AnyObject {
    /// Дочерние координаторы
    var childCoordinators: [Coordinator] { get set }
    
    /// Делегат завершения координатора
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    /// Тип координатора
    var type: CoordinatorType { get }
    
    /// Роутер для навигации
    var router: Router { get }

    /// Метод запуска координатора
    func start()
}

// MARK: - Coordinator Default Implementation
extension Coordinator {
    func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
    
    func finish() {
        router.pop(animated: true)
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

// MARK: - CoordinatorFinishDelegate
protocol CoordinatorFinishDelegate: AnyObject {
    /// Метод, вызываемый при завершении дочернего координатора
    /// - Parameter childCoordinator: Завершенный координатор
    func coordinatorDidFinish(childCoordinator: Coordinator)
}
