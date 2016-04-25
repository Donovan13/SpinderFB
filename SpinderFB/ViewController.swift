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
//        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
//        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
//        loginButton.center = self.view.center
//        view.addSubview(loginButton)
        

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
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    
}

