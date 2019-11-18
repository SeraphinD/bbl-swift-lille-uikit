//
//  UIImage+MyUIKit.swift
//  MyUIKit
//
//  Created by Séraphin Desumeur on 18/11/2019.
//

import Foundation

extension UIImage {
    
    public class var clear: UIImage! {
        return image(named: "clear")
    }

    private class func image(named: String) -> UIImage! {
        return UIImage(named: named, in: MyUIKit.bundle, compatibleWith: nil)
    }
    
}
