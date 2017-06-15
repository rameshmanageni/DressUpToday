//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

final class JoinViewModel {
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

enum JoinInformation: String {
    case FIRST_NAME = "firstName"
    case LAST_NAME = "lastName"
    case EMAIL = "Email"
    case PASSWORD = "password"
}
