import Swinject
import SwinjectAutoregistration
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let assembler: Assembler
    var window: UIWindow?

    override init() {
        self.assembler = Assembler.defaultAssembler
    }

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
