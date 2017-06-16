//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

final class JoinLocalDataManager: JoinLocalDataManagerInputProtocol {
    init() {}
    let defaults = UserDefaults.standard

    func joinNewUser(model: JoinViewModel, callback: @escaping (ECallbackResultType) -> Void) {
        defaults.set(true, forKey: "isUserAlreadyLoggedIn")
        callback(.Success)
    }
}
