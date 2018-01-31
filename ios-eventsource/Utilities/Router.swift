//
//  Router.swift
//  ios-eventsource
//
//  Created by Danial Zahid on 1/29/18.
//  Copyright © 2018 DanialZahid. All rights reserved.
//

import UIKit

class Router: NSObject {
    
    static func showChatViewController(senderName: String, from controller: UIViewController) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: ChatViewController.storyboardID) as! ChatViewController
        vc.senderDisplayName = senderName
        controller.navigationController?.show(vc, sender: nil)
    }
}
