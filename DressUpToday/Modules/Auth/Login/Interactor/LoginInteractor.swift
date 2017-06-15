//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

final class LoginInteractor: LoginInteractorInputProtocol {
    weak var presenter: LoginInteractorOutputProtocol?
    var localDataManager: LoginLocalDataManagerInputProtocol?
    
    init() {}
    
    func authenticateUser(model: LoginDomainModel) {
        self.presenter?.onUserLoginSucceeded()
    }
    
    func isUserAlreadyLoggedIn() -> Bool {
      return (self.localDataManager?.isUserAlreadyLoggedIn())!
    }
}
