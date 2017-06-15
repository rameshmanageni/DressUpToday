//
//  Enum.swift
//  Mezuka
//
//  Created by VikasRedbytes on 02/01/17.
//  Copyright © 2017 Mezuka. All rights reserved.
//

import Foundation

enum CreditCard: String {
    case Visa = "Visa"
    case Mastercard = "Mastercard"
    case AMEX = "AMEX"
    case Discover = "Discover"
    case Diners = "Diners"
    case JCB = "JCB"
}

enum OrderStatusCode: String {
    case COMPLETE = "COMPLETE"
    case INPROGRESS = "IN PROGRESS"
    case CANCELED = "CANCELED"
    case AWAITING = "AWAITING"
}

enum CardInformation: String {
    case CARD_NUMBER = "Card Number"
    case EXPIRY_DATE = "Expiry Date"
    case CVC = "CVC"
    case ZIP = "Zip"
}
