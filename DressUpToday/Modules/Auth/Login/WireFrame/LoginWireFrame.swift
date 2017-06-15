//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation
import UIKit

final class LoginWireFrame: LoginWireFrameProtocol {
    weak var view: UIViewController?
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
 
    class func setupLoginModule() -> UIViewController {
        // Generating module components
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "LoginViewNavigation") as! UINavigationController
        let view: LoginViewProtocol = navigation.topViewController as! LoginView

        let presenter: LoginPresenterProtocol & LoginInteractorOutputProtocol = LoginPresenter()
        let interactor: LoginInteractorInputProtocol = LoginInteractor()
        let localDataManager: LoginLocalDataManagerInputProtocol = LoginLocalDataManager()
        let wireFrame: LoginWireFrameProtocol = LoginWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDataManager = localDataManager
        wireFrame.view = navigation
        
        return navigation
    }
        
    func navigateToJoinModule() {
        let joinView = JoinWireFrame.setupJoinModule()
        (view as! UINavigationController).pushViewController(joinView, animated: false)
    }
    
    func navigateToHomeModule() {
        let homeView = HomeWireFrame.setupHomeModule()
        (view as! UINavigationController).pushViewController(homeView, animated: false)
    }
    
    func navigateToForgotPasswordModule() {
    }
}
