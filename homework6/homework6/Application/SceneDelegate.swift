import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let presenter = CarListPresenter()
        let viewController = CarListViewController(presenter: presenter)
        let navigation = UINavigationController(rootViewController: viewController)
        
        let backButtonAppearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationController.self])
        backButtonAppearance.tintColor = ColorEnum.accentGreen
        
        window.rootViewController = navigation
        
        window.makeKeyAndVisible()
        self.window = window
    }

}

