//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

final class JoinPresenter: JoinPresenterProtocol, JoinInteractorOutputProtocol {
    weak var view: JoinViewProtocol?
    var interactor: JoinInteractorInputProtocol?
    var wireFrame: JoinWireFrameProtocol?
    var emailAccepted = false

    func notifyEmailAddress(text: String) {
        emailAccepted = (interactor?.validateEmailAddress(text: text))!
        guard emailAccepted else {
            emailAccepted = false
            let message = "inValid Email ID".localized(in: "JoinView")
            view?.displayErrorMessage(message: message)
            return
        }
    }
    
    func notifyTextChangedInTextFields() {
        DispatchQueue.global().async {
            let viewModel = self.view?.getJoinViewModel()
    
            if(viewModel != nil) {
                let firstName = viewModel?.firstName
                let lastName = viewModel?.lastName
                let email = viewModel?.email
                let password = viewModel?.password
                
                if ((firstName?.isEmpty)! == false && (lastName?.isEmpty)! == false && (email?.isEmpty)! == false && (password?.isEmpty)! == false) && self.emailAccepted {
                    self.view?.activateJoinButton()
                } else {
                    self.view?.deactivateJoinButton()
                }
            }
        }
    }
    
    func notifyLoginButtonTapped() {
        wireFrame?.navigateToLoginModule()
    }
    
    func notifyJoinButtonTapped() {
        DispatchQueue.global().async {
            let viewModel = self.view?.getJoinViewModel()
            
//            if(viewModel != nil) {
//                let model = JoinViewModel(firstName: (viewModel?.firstName)!, lastName: (viewModel?.lastName)!, email: (viewModel?.email)!, password: (viewModel?.password)!)
//                self.interactor?.joinNewUser(model: model)
//            }
        }
    }
    
    func notifyTermsOfServicesTapped() {
        
    }
    
    func notifyFacebookButtonTapped() {
        
    }
    
    func notifyGooglePlusButtonTapped() {
        
    }
    
//    func onJoinNewUserSucceeded() {
//        let message = "Welcome to Mezuka".localized(in: "JoinView")
//        view?.displaySucceededMessage(message: message)
//    }
//    
//    func onJoinNewUserFailed(error: EApiErrorType) {
//        let message = "Server related problem".localized(in: "JoinView")
//        view?.displayErrorMessage(message: message)
//    }
}
