//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

final class LoginPresenter: LoginPresenterProtocol, LoginInteractorOutputProtocol {
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var wireFrame: LoginWireFrameProtocol?
    
    init() {}
    
    func notifyViewDidLoad() {
        if(interactor?.isUserAlreadyLoggedIn())! {
            wireFrame?.navigateToHomeModule()
        }
    }

    func notifyLoginButtonTapped() {
        let viewModel = view?.getLoginViewModel()
        
        if(viewModel != nil) {
            let model = LoginDomainModel(email: (viewModel?.email)!, password: (viewModel?.password)!, rememberMe: (viewModel?.rememberMe)!)
            interactor?.authenticateUser(model: model)
        }
    }
    
    /**
        This method will handle the typing, if one of the text fields are empty, login button should be deactivated
    */
    func notifyTextChangedInTextFields() {
        let viewModel = view?.getLoginViewModel()
        
        if(viewModel != nil) {
            let email = viewModel?.email
            let password = viewModel?.password
            
            if ((email?.isEmpty)! == false && (password?.isEmpty)! == false) {
                view?.activateLoginButton()
            } else {
                view?.deactivateLoginButton()
            }
        }
    }
    
    func notifyJoinButtonTapped() {
        wireFrame?.navigateToJoinModule()
    }
    
    func notifyForgotPasswordButtonTapped() {
        wireFrame?.navigateToForgotPasswordModule()
    }
    
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */

    func onUserLoginSucceeded() {
        // Convert Domain Model to View Model
        // Send to wireframe to route somewhere else
        print("Hey you logged in")
        view?.navigateBackToViewController()
    }
    
    func onUserLoginFailed() {
        // Update the view
        print("Ooops, there is a problem with your creditantials")
    }
}
