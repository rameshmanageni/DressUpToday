//
//  UIViewController+KeyboardDismiss.swift
//  Mezuka
//
//  Created by Hasan H. Topcu on 19/10/2016.
//  Copyright © 2016 Mezuka. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
