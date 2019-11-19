import Foundation

public var colors: MyColorProtocol { return MyUIKit.shared.colors }
public var textStyles: MyTextStyleProtocol { return MyUIKit.shared.textStyles }

final public class MyUIKit {
    
    fileprivate var colors: MyColorProtocol!
    fileprivate var textStyles: MyTextStyleProtocol!
    
    private init() {}
    public static let shared = MyUIKit()

    var bundle: Bundle! {
        let podBundle: Bundle! = Bundle(for: MyUIKit.self)
        let bundleUrl: URL! = podBundle.url(forResource: "MyUIKit",
                                            withExtension: "bundle")
        return Bundle(url: bundleUrl)
    }
    
    public func initialize(colors: MyColorProtocol,
                           textStyles: MyTextStyleProtocol) {
        self.colors = colors
        self.textStyles = textStyles
    }
}
