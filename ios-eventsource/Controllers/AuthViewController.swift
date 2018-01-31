//
//  AuthViewController.swift
//  ios-eventsource
//
//  Created by Danial Zahid on 1/28/18.
//  Copyright © 2018 DanialZahid. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var usernameField: DesignableTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Fanout"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        if let username = usernameField.text, username.length > 0 {
            Router.showChatViewController(senderName: username, from: self)
        }
    }
    

}
