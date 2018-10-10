import Swinject
import SwinjectAutoregistration
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let assembler: Assembler
    private let rootViewController: UIViewController

    var window: UIWindow?

    override init() {
        self.assembler = Assembler.defaultAssembler
        self.rootViewController = assembler.resolver ~> MainViewController.self
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = self.rootViewController

        guard let window = window else {
            fatalError("Window was handled unexpectedly in AppDelegate")
        }

        window.rootViewController = rootViewController
        window.makeKeyAndVisible()

        return true
    }

    func application(_ application: UIApplication,
                     shouldAllowExtensionPointIdentifier
                     extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        if extensionPointIdentifier == UIApplication.ExtensionPointIdentifier.keyboard {
            return false
        }
        return true
    }

}
