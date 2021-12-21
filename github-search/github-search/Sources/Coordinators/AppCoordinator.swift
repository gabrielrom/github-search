import Foundation
import UIKit

class AppCoordinator {
  let window: UIWindow?

  var navController: UINavigationController = {
    let nav = UINavigationController()
    nav.pushViewController(FeedViewController(), animated: true)
    nav.setNavigationBarHidden(true, animated: false)
    return nav
  }()

  init(window: UIWindow?) {
    self.window = window
  }

  func start() {
    guard let window = window else { return }

    window.rootViewController = navController
    window.makeKeyAndVisible()
  }

  func finish() { }
  
  func goToPullRequestScreen() {
    let pullRequestViewController = PullRequestsViewController()
    navController.pushViewController(pullRequestViewController, animated: true)
  }
}

