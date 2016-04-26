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

        

        let item1 = ParallaxItem(image: UIImage(named: "image1")!, text: "Go run with someone!")
        let item2 = ParallaxItem(image: UIImage(named: "image2")!, text: "Puppy Play Date!")
        let item3 = ParallaxItem(image: UIImage(named: "image3")!, text: "Beach games with new friends!!")
        let item4 = ParallaxItem(image: UIImage(named: "image4")!, text: "Walk your baby with another mom! Woo!!")


        
        let ParallaxViewController = Parallax(items: [item1, item2, item3, item4], motion: false)
        ParallaxViewController.completionHandler = {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                ParallaxViewController.view.alpha = 0.0
            })
        }
        
        // Adding parallax view controller.
        self.addChildViewController(ParallaxViewController)
        self.view.addSubview(ParallaxViewController.view)
        ParallaxViewController.didMoveToParentViewController(self)

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
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    
}

