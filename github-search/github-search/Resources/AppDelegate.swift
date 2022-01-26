import UIKit
import UserNotificationsUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let AppCoordinator = AppCoordinator(window: window)
    AppCoordinator.start()
    
    let center = UNUserNotificationCenter.current()
    
    // Pede Autorizacao ao usuario.
    center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
      if !granted {
        print("O usuario nao aceitou!")
      }
    }
    
    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
  }
}

