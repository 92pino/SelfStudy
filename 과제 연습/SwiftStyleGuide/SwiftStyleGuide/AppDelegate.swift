import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupKeyWindow()
        return true
    }
    
    func setupKeyWindow() {
        let listVC = ListViewController()
        let naviController = UINavigationController(rootViewController: listVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = naviController
        window?.makeKeyAndVisible()
    }
}
