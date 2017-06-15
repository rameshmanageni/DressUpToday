//
//  TextField+Customization.swift
//  Mezuka
//
//  Created by VikasRedbytes on 22/02/17.
//  Copyright © 2017 Mezuka. All rights reserved.
//
import Foundation
import UIKit

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.mezukaBorderGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

