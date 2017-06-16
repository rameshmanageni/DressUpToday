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
        localDataManager?.authenticateUser(model: model, callback: { (result) in
            switch result {
            case .Failure:
                self.presenter?.onUserLoginFailed()
            case .Success:
                self.presenter?.onUserLoginSucceeded()
            default:
                break
            }
        })
    }
    
    func isUserAlreadyLoggedIn() -> Bool {
      return (self.localDataManager?.isUserAlreadyLoggedIn())!
    }
    
    func validateEmailAddress(text: String) -> Bool {
        let emailValidator = EmailValidator()
        let emailAccepted = emailValidator.isValid(text: text)
        return emailAccepted
    }
}
