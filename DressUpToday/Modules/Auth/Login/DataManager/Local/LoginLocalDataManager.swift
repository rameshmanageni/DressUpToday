//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

final class LoginLocalDataManager: LoginLocalDataManagerInputProtocol {
    init() {}
    let defaults = UserDefaults.standard
    
    func isUserAlreadyLoggedIn() -> Bool {
        return defaults.value(forKey: "isUserAlreadyLoggedIn") as! Bool
    }
    
    func authenticateUser(model: LoginDomainModel, callback: @escaping (ECallbackResultType) -> Void) {
        defaults.set(true, forKey: "isUserAlreadyLoggedIn")
        callback(.Success)
    }
}
