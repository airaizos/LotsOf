import UIKit

public struct LoginModule {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    public func getModuleStoryboard() -> UIStoryboard {
      let storyboard = UIStoryboard(name: "LoginViewController", bundle: .module)
       return storyboard
    }
}
