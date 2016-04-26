//
//  ViewController.swift
//  SpinderFB
//
//  Created by Kyle on 4/24/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
        //        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        //        loginButton.center = self.view.center
        //        view.addSubview(loginButton)
        //
    }
    
    @IBAction func facebookLogin(sender: AnyObject) {
        let myRootRef = Firebase(url: "https://spinderfb.firebaseio.com/")
        let facebookLogin = FBSDKLoginManager()
        
        print("logging in")
        
        facebookLogin.logInWithReadPermissions(["email", "public_profile", "user_friends"], fromViewController: self, handler: {(facebookResult, facebookError) -> Void in
            if facebookError != nil {
                print("FB/log in error")
            } else if facebookResult.isCancelled {
                print("FB/log in cancelled")
            } else {
                let acessToken = FBSDKAccessToken.currentAccessToken().tokenString
                myRootRef.authWithOAuthProvider("facebook", token: acessToken, withCompletionBlock: { error, authData in
                    if error != nil {
                        print("login failed.")
                    } else {
                        print("logged in ")
                        
                        let newUser = ["provider": authData.provider as NSString,
                            "profileImageURL": authData.providerData["profileImageURL"] as! NSString,
                            "displayName": authData.providerData["displayName"] as! NSString,
                            "cachedUserProfile": authData.providerData["cachedUserProfile"] as! NSDictionary
                        ] as NSDictionary
                        myRootRef.childByAppendingPath("users").childByAppendingPath(authData.uid).setValue(newUser as AnyObject)
                        
                    }
                })
                
            }
        })
    }
    
}

