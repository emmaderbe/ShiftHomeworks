import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupAppearance()
    }
}

extension TabBarController {
    private func setupTabBar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainView = storyboard.instantiateViewController(withIdentifier: "MainInfoViewController") as! MainInfoViewController
        
        let mainInfoVC = self.createNav(with: "Обо мне", and: UIImage(systemName: "person.fill"), vc: mainView)
        let itSkillsVC = self.createNav(with: "Разработка", and: UIImage(systemName: "macbook"), vc: ItSkillsViewController())
        let hobbyVC = self.createNav(with: "Хобби", and: UIImage(systemName: "heart.fill"), vc: HobbyViewController())
        
        self.viewControllers = [mainInfoVC, itSkillsVC, hobbyVC]
    }
}

extension TabBarController {
    private func createNav(with title: String,
                              and image: UIImage?,
                              vc: UIViewController) -> UINavigationController {
       let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }
}

extension TabBarController {
    private func setupAppearance() {
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.cornerRadius = tabBar.frame.width / 15
        self.tabBar.tintColor = .systemBrown
        self.tabBar.unselectedItemTintColor = .systemGray2
    }
}
