//
//  SignInCoordinator.swift
//  AppNews
//
//  Created by Илюха on 17.03.2025.
//

import UIKit

final class SignInCoordinator: Coordinator {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var childCoordinators: [Coordinator] = []
    let router: Router
    var type: CoordinatorType { .auth }

    init(router: Router) {
        self.router = router
    }

    func start() {
        let viewModel = DependencyFactory.shared.createSignInViewModel()
        let signInVC = SignInViewController(viewModel: viewModel)
        signInVC.didCompleteSignIn = { [weak self] in
            self?.navigateToMainScreen()
        }
        
        router.setRootModule(signInVC, animated: true, hideBar: true)
    }

    private func navigateToMainScreen() {
        finish()
    }
}
