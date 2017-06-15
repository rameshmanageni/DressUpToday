//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

/** Use Object Mapper */
final class JoinDomainModel {
    // Members
    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    
    init(firstName: String, lastName: String, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
}
