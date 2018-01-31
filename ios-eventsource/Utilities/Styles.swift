//
//  Styles.swift
//  edX
//
//  Created by Danial Zahid on 25/05/2015.
//  Copyright (c) 2015 edX. All rights reserved.
//

import Foundation
import UIKit

class Styles {
    
    static let sharedStyles = Styles()
    
    public func applyGlobalAppearance() {
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.17, green: 0.24, blue: 0.27, alpha: 1.0)
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().tintColor = .white
        UIToolbar.appearance().tintColor = UIColor(red: 0.17, green: 0.24, blue: 0.27, alpha: 1.0)
        
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)

        UINavigationBar.appearance().isTranslucent = false
        
        let attributes : [NSAttributedStringKey: Any] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): UIFont.systemFont(ofSize: 15.0, weight: .semibold),
                                                         NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = attributes
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        
    }
}
