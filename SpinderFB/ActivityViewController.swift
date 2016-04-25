//
//  ActivityViewController.swift
//  SpinderFB
//
//  Created by Kyle on 4/25/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuItemImage = UIImage(named: "bg-menuitem")!
        let menuItemHighlitedImage = UIImage(named: "bg-menuitem-highlighted")!
        let basketballImage = UIImage(named: "footballc40")!
        let baseballImage = UIImage(named: "bikec40")!
        let volleyballImage = UIImage(named: "weightsc40")!
        let soccerImage = UIImage(named: "gamepadc40")!
        let bowlingImage = UIImage(named: "dogc40")!

        
        let menuItem1 = PathMenuItem(image: menuItemImage, highlightedImage: menuItemHighlitedImage, contentImage: basketballImage)
        
        let menuItem2 = PathMenuItem(image: menuItemImage, highlightedImage: menuItemHighlitedImage, contentImage: baseballImage)
        
        let menuItem3 = PathMenuItem(image: menuItemImage, highlightedImage: menuItemHighlitedImage, contentImage: volleyballImage)
        
        let menuItem4 = PathMenuItem(image: menuItemImage, highlightedImage: menuItemHighlitedImage, contentImage: soccerImage)
        
        let menuItem5 = PathMenuItem(image: menuItemImage, highlightedImage: menuItemHighlitedImage, contentImage: bowlingImage)
        

        
        
        
        let items = [menuItem1, menuItem2, menuItem3, menuItem4, menuItem5]
        
        let startItem = PathMenuItem(image: UIImage(named: "bg-addbutton")!,
                                     highlightedImage: UIImage(named: "bg-addbutton-highlighted"),
                                     contentImage: UIImage(named: "icon-plus"),
                                     highlightedContentImage: UIImage(named: "icon-plus-highlighted"))
        
        let menu = PathMenu(frame: view.bounds, startItem: startItem, items: items)
        menu.delegate = self
        menu.startPoint     = CGPointMake(UIScreen.mainScreen().bounds.width/2, view.frame.size.height - 100.0)
        menu.menuWholeAngle = (CGFloat(M_PI) - CGFloat(M_PI/5))
        menu.rotateAngle    = -CGFloat(M_PI_2) + CGFloat(M_PI/5) * 1/2
        menu.timeOffset     = 0.05
        menu.farRadius      = 110.0
        menu.nearRadius     = 90.0
        menu.endRadius      = 100.0
        menu.animationDuration = 0.5
        
        view.addSubview(menu)
        view.backgroundColor = UIColor(red:0.96, green:0.94, blue:0.92, alpha:1)
    }
    
}

extension ActivityViewController: PathMenuDelegate {
    func pathMenu(menu: PathMenu, didSelectIndex idx: Int) {
        print("Select the index : \(idx)")
    }
    
    func pathMenuWillAnimateOpen(menu: PathMenu) {
        print("Menu will open!")
    }
    
    func pathMenuWillAnimateClose(menu: PathMenu) {
        print("Menu will close!")
    }
    
    func pathMenuDidFinishAnimationOpen(menu: PathMenu) {
        print("Menu was open!")
    }
    
    func pathMenuDidFinishAnimationClose(menu: PathMenu) {
        print("Menu was closed!")
    }
}


