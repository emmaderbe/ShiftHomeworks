import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navViewController = UINavigationController(rootViewController: DogListViewController())
        window.rootViewController = navViewController
        window.makeKeyAndVisible()
        self.window = window
    }
}

