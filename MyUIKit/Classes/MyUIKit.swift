//
//  MyUIKit.swift
//  MyUIKit
//
//  Created by Séraphin Desumeur on 18/11/2019.
//

import Foundation

public var colors: MyColorProtocol { return MyUIKit.colors }
public var textStyles: MyTextStyleProtocol { return MyUIKit.textStyles }

final class MyUIKit {
    
    fileprivate static var colors: MyColorProtocol!
    fileprivate static var textStyles: MyTextStyleProtocol!
    
    private init() {}
    public static let shared = MyUIKit()

    class var bundle: Bundle! {
        let podBundle: Bundle! = Bundle(for: MyUIKit.self)
        let bundleUrl: URL! = podBundle.url(forResource: "MyUIKit",
                                            withExtension: "bundle")
        return Bundle(url: bundleUrl)
    }
    
    public static func initialize(colors: MyColorProtocol,
                                  textStyles: MyTextStyleProtocol) {
        self.colors = colors
        self.textStyles = textStyles
    }
}
