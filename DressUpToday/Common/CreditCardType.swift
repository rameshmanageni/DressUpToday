//
//  CreditCardType.swift
//  Mezuka
//
//  Created by VikasRedbytes on 09/01/17.
//  Copyright © 2017 Mezuka. All rights reserved.
//

import Foundation

// MARK:- Enum which encapsulates different card types and method to find the type of card.
enum CreditCardType: Int {
    case Visa
    case Mastercard
    case AMEX
    case Discover
    case Diners
    case JCB
    
    func validationRegex() -> String {
        var regex = ""
        switch self {
        case .Visa:
            regex = "^4[0-9]{12}(?:[0-9]{3})?$"
            
        case .Mastercard:
            regex = "^5[1-5][0-9]{14}$"
            
        case .AMEX:
            regex = "^3[47][0-9]{13}$"
            
        case .Discover:
            regex = "^6(?:011|5[0-9]{2})[0-9]{12}$"
            
        case .Diners:
            regex = "^3(?:0[0-6]|[68][0-9])[0-9]{11}$"
            
        case .JCB:
            regex = "^(?:2131|1800|35\\d{3})\\d{11}$"
        }
        
        return regex
    }
    
    func validate(cardNumber: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", validationRegex())
        return predicate.evaluate(with: cardNumber)
    }
    
    // Method returns the credit card type for given card number
    static func cardTypeForCreditCardNumber(cardNo: String) -> String?  {
        var creditCardType: String = ""
        var index = 0
        
        while let cardType = CreditCardType(rawValue: index) {
            if cardType.validate(cardNumber: cardNo) {
                //creditCardType = cardType
                creditCardType = String(describing: cardType)
                break
            } else {
                index += 1
            }
        }
        return creditCardType
    }
}
