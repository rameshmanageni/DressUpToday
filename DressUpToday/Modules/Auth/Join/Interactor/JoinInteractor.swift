//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

final class JoinInteractor: JoinInteractorInputProtocol {
    weak var presenter: JoinInteractorOutputProtocol?
    var localDataManager: JoinLocalDataManagerInputProtocol?
    
    init() {}
    
    func validateEmailAddress(text: String) -> Bool {
        let emailValidator = EmailValidator()
        let emailAccepted = emailValidator.isValid(text: text)
        return emailAccepted
    }
    
    func joinNewUser(model: JoinViewModel) {
        localDataManager?.joinNewUser(model: model, callback: { (result) in
            switch result {
            case .Failure:
                self.presenter?.onJoinNewUserFailed()
            case .Success:
                self.presenter?.onJoinNewUserSucceeded()
            }
        })
    }
}
