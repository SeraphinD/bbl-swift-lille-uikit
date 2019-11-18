//
//  MyUIKit.swift
//  MyUIKit
//
//  Created by Séraphin Desumeur on 18/11/2019.
//

import Foundation

public var colors: MyColorProtocol { return MyUIKit.shared.colors }
public var textStyles: MyTextStyleProtocol { return MyUIKit.shared.textStyles }

final class MyUIKit {
    
    fileprivate var colors: MyColorProtocol!
    fileprivate var textStyles: MyTextStyleProtocol!
    
    private init() {}
    public static let shared = MyUIKit()

    class var bundle: Bundle! {
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
