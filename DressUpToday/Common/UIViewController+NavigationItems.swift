 //
//  UIViewController+NavigationItems.swift
//  Mezuka
//
//  Created by Hasan H. Topcu on 18/09/2016.
//  Copyright © 2016 Mezuka. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func activateHamburgerIcon() {
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "Hamburger")!, style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.onHamburgerMenuBarTapped))
        
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.mezukaNavigationBarButton
    }
    
    func activateBackIcon() {
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")!, style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.onBackBarTapped))
        
        leftButton.imageInsets = UIEdgeInsets(top: 10, left: 4, bottom: 8, right: 7)
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.mezukaNavigationBarButton
    }
    
    func activateSearchIcon() {
        let rightButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "search")!, style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.onSearchMenuBarTapped))
        rightButton.tintColor = UIColor.mezukaNavigationBarButton
        
        if var items = self.navigationItem.rightBarButtonItems {
            items.append(rightButton)
            self.navigationItem.rightBarButtonItems = items
        } else {
            self.navigationItem.rightBarButtonItem = rightButton
        }
    }
    
    func activateMyOrderIcon() {
        let rightButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "bag")!, style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.onMyOrderMenuBarTapped))
        rightButton.tintColor = UIColor.mezukaNavigationBarButton
        
        if var items = self.navigationItem.rightBarButtonItems {
            items.append(rightButton)
            self.navigationItem.rightBarButtonItems = items
        } else {
            self.navigationItem.rightBarButtonItem = rightButton
        }
    }
    
    func onHamburgerMenuBarTapped() {
       //JoinWireFrame.sharedInstance.openMenu()
    }
    
    func onBackBarTapped() {
        (self.parent as! UINavigationController).popViewController(animated: true)
    }
    
    func onSearchMenuBarTapped() {
        //MenuWireFrame.sharedInstance.navigateToSearchView()
    }
    
    func onMyOrderMenuBarTapped() {
        //MenuWireFrame.sharedInstance.presentMyOrderView()
    }
}
