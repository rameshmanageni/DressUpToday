//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation
import UIKit

protocol JoinViewProtocol: class {
    var presenter: JoinPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func getJoinViewModel() -> JoinViewModel
    func activateJoinButton()
    func deactivateJoinButton()
    func displayErrorMessage(message: String)
    func displaySucceededMessage(message: String)
}

protocol JoinWireFrameProtocol: class {
    weak var view: UIViewController? {get set}
    static func setupJoinModule() -> UIViewController
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func navigateToLoginModule()
    func navigateToHomeModule()
}

protocol JoinPresenterProtocol: class {
    var view: JoinViewProtocol? { get set }
    var interactor: JoinInteractorInputProtocol? { get set }
    var wireFrame: JoinWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func notifyEmailAddress(text: String)
    func notifyTextChangedInTextFields()
    func notifyLoginButtonTapped()
    func notifyJoinButtonTapped()
}

protocol JoinInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func onJoinNewUserSucceeded()
    func onJoinNewUserFailed()
}

protocol JoinInteractorInputProtocol: class {
    var presenter: JoinInteractorOutputProtocol? { get set }
    var localDataManager: JoinLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func validateEmailAddress(text: String) -> Bool
    func joinNewUser(model: JoinViewModel)
}

protocol JoinLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
    func joinNewUser(model: JoinViewModel, callback: @escaping (ECallbackResultType) -> Void)
}
