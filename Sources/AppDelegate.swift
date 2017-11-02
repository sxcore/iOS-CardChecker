import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = UIViewController()
        mainViewController.view.backgroundColor = UIColor.red

        guard let window = window else {
            fatalError("Window was handled unexpectedly in AppDelegate")
        }

        window.rootViewController = mainViewController
        window.makeKeyAndVisible()

        return true
    }

}
