import Foundation

extension UIImage {
    
    public class var clear: UIImage! {
        return image(named: "clear")
    }

    private class func image(named: String) -> UIImage! {
        return UIImage(named: named, in: MyUIKit.shared.bundle, compatibleWith: nil)
    }
    
}
