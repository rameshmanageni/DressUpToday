//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

/** Use Object Mapper */
final class LoginDomainModel {
    var email: String = ""
    var password: String = ""
    var rememberMe: Bool = false

    init(email: String, password: String, rememberMe: Bool) {
        self.email = email
        self.password = password
        self.rememberMe = rememberMe
    }
}
