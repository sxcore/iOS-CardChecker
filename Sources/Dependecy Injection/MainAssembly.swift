import Foundation
import Swinject
import SwinjectAutoregistration

class MainAssembly: Assembly {

    func assemble(container: Container) {
        container.autoregister(MainViewController.self, initializer: MainViewController.init)
    }

}
