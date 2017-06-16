//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewProtocol: class {
    var presenter: LoginPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func getLoginViewModel() -> LoginViewModel
    func activateLoginButton()
    func deactivateLoginButton()
    func displayErrorMessage(message: String)
    func navigateBackToViewController()
}

protocol LoginWireFrameProtocol: class {
    weak var view: UIViewController? {get set}
    static func setupLoginModule() -> UIViewController
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func navigateToJoinModule()
    func navigateToHomeModule()
    func navigateToForgotPasswordModule()
}

protocol LoginPresenterProtocol: class {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorInputProtocol? { get set }
    var wireFrame: LoginWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func notifyTextChangedInTextFields()
    func notifyLoginButtonTapped()
    func notifyJoinButtonTapped()
    func notifyForgotPasswordButtonTapped()
    func notifyViewDidLoad()
}

protocol LoginInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func onUserLoginSucceeded()
    func onUserLoginFailed()
}

protocol LoginInteractorInputProtocol: class {
    var presenter: LoginInteractorOutputProtocol? { get set }
    var localDataManager: LoginLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func authenticateUser(model: LoginDomainModel)
    func isUserAlreadyLoggedIn() -> Bool
    func validateEmailAddress(text: String) -> Bool
}

protocol LoginLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
    func isUserAlreadyLoggedIn() -> Bool
    func authenticateUser(model: LoginDomainModel, callback: @escaping (ECallbackResultType) -> Void)
}
