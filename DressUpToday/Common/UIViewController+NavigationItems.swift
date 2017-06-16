 //
//  UIViewController+NavigationItems.swift
//  Mezuka
//
//  Created by Hasan H. Topcu on 18/09/2016.
//  Copyright © 2016 Mezuka. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func activateBackIcon() {
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")!, style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.onBackBarTapped))
        
        leftButton.imageInsets = UIEdgeInsets(top: 10, left: 4, bottom: 8, right: 7)
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.mezukaNavigationBarButton
    }
    
    func activateMySavedPairIcon() {
        let rightButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "bag")!, style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.onMySavedPairMenuBarTapped))
        rightButton.tintColor = UIColor.mezukaNavigationBarButton
        
        if var items = self.navigationItem.rightBarButtonItems {
            items.append(rightButton)
            self.navigationItem.rightBarButtonItems = items
        } else {
            self.navigationItem.rightBarButtonItem = rightButton
        }
    }
    
    func activateLogoutIcon() {
        let rightButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "logout")!, style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.onLogoutMenuBarTapped))
        rightButton.tintColor = UIColor.mezukaNavigationBarButton
        
        if var items = self.navigationItem.rightBarButtonItems {
            items.append(rightButton)
            self.navigationItem.rightBarButtonItems = items
        } else {
            self.navigationItem.rightBarButtonItem = rightButton
        }
    }

    func onBackBarTapped() {
        (self.parent as! UINavigationController).popViewController(animated: true)
    }
    
    func onMySavedPairMenuBarTapped() {
       let savedPairView = SavedPairWireFrame.setupSavedPairModule()
        (self.parent as! UINavigationController).pushViewController(savedPairView, animated: true)
    }
    
    func onLogoutMenuBarTapped() {
        self.askForLogoutIfUserIsSure()
    }
    
    func askForLogoutIfUserIsSure() {
        let message = "Are you sure?".localized(in: "Login")
        let cancel = "Cancel".localized(in: "Cancel")
        let logout = "Log out".localized(in: "Log out")
        
        let logoutAlert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        logoutAlert.addAction(UIAlertAction(title: cancel, style: .default, handler: nil))
        logoutAlert.addAction(UIAlertAction(title: logout, style: .default, handler: { (action: UIAlertAction!) in
            UserDefaults.standard.set(false, forKey: "isUserAlreadyLoggedIn")
            (self.parent as! UINavigationController).popToRootViewController(animated: false)
        }))
        
        self.present(logoutAlert, animated: true, completion: nil)
    }
}
