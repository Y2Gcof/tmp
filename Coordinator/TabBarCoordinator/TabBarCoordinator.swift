import UIKit
import Swinject
                                    
final class TabBarCoordinator: Coordinator {
    var type: CoordinatorType { .tabBar }
    var childCoordinators: [Coordinator] = []
    weak var finishDelegate: CoordinatorFinishDelegate?
    var router: Router
    
    private var tabBarController: UITabBarController
    
    init(router: Router) {
        self.router = router
//        self.tabBarController = UITabBarController()
        self.tabBarController = TabBarController()
    }
}

// MARK: - TabBarCoordinator
extension TabBarCoordinator {
    func start() {
        
        let homeCoordinator = DependencyFactory.shared.getHomeCoordinator()
        let searchCoordinator = DependencyFactory.shared.getSearchCoordinator()
        let favoritesCoordinator = DependencyFactory.shared.getFavoritesCoordinator()
        let profileCoordinator = DependencyFactory.shared.getProfileCoordinator()
        
        let homeNav = DependencyFactory.shared.getHomeNavigationController()
        let searchNav = DependencyFactory.shared.getSearchNavigationController()
        let favoritesNav = DependencyFactory.shared.getFavoritesNavigationController()
        let profileNav = DependencyFactory.shared.getProfileNavigationController()
        
        childCoordinators.append(contentsOf: [homeCoordinator, searchCoordinator, favoritesCoordinator, profileCoordinator] as [any Coordinator])
        
        homeCoordinator.start()
        searchCoordinator.start()
        favoritesCoordinator.start()
        profileCoordinator.start()
        
        
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        searchNav.tabBarItem = UITabBarItem(title: "Search", image: nil, tag: 1)
        favoritesNav.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 2)
        profileNav.tabBarItem = UITabBarItem(title: "Settings", image: nil, tag: 3)
        
        tabBarController.viewControllers = [homeNav, searchNav, favoritesNav, profileNav]
        router.setRootModule(tabBarController, animated: true, hideBar: true)
    }
}
