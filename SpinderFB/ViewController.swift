//
//  ViewController.swift
//  SpinderFB
//
//  Created by Kyle on 4/24/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        view.addSubview(loginButton)
        
    }
    
}

