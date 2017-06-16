//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation
import UIKit

final class LoginView: UIViewController, LoginViewProtocol {
    var presenter: LoginPresenterProtocol?
    
   // Our custom view from the Storiboard file
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailLabel: MezukaTextField!
    @IBOutlet weak var passwordLabel: MezukaTextField!
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.isEnabled = false
        self.loginButton.backgroundColor = UIColor.mezukaPassiveGreen

        self.emailLabel.setTextChangedAction {
            self.presenter?.notifyTextChangedInTextFields()
        }
        
        self.passwordLabel.setTextChangedAction {
            self.presenter?.notifyTextChangedInTextFields()
        }
        
        self.hideKeyboardWhenTappedAround()
        self.presenter?.notifyViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.presenter?.notifyViewDidLoad()
    }
    
    func getLoginViewModel() -> LoginViewModel {
        return LoginViewModel(
            email: self.emailLabel.getText(),
            password: self.passwordLabel.getText(),
            rememberMe: self.rememberMeSwitch.isOn
        )
    }
    
    func activateLoginButton() {
        self.loginButton.backgroundColor = UIColor.mezukaActiveGreen
        self.loginButton.isEnabled = true
    }
    
    func deactivateLoginButton() {
        self.loginButton.backgroundColor = UIColor.mezukaPassiveGreen
        self.loginButton.isEnabled = false
    }
    
    @IBAction func onForgotPasswordButtonTapped(_ sender: AnyObject) {
        presenter?.notifyForgotPasswordButtonTapped()
    }
    
    @IBAction func onJoinButtonTapped(_ sender: AnyObject) {
        presenter?.notifyJoinButtonTapped()
    }
    
    @IBAction func onLoginButtonTapped(_ sender: AnyObject) {
        self.emailLabel.clearText()
        self.passwordLabel.clearText()
        self.loginButton.isEnabled = false
        self.loginButton.backgroundColor = UIColor.mezukaPassiveGreen
        self.view.endEditing(true)
        presenter?.notifyLoginButtonTapped()
    }
    
    func navigateBackToViewController() {
        (self.parent as? UINavigationController)?.popViewController(animated: true)
    }

    func displayErrorMessage(message: String) {
        //self.showStylishErrorMessage(message: message)
    }
}
