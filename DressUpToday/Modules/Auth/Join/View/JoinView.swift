//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation
import UIKit

final class JoinView: UIViewController, JoinViewProtocol {
    var presenter: JoinPresenterProtocol?
    
    @IBOutlet var textFields: [FloatLabelTextField]!
    @IBOutlet weak var firstNameLabel: FloatLabelTextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var joinButton: UIButton!
    
    override func viewDidLoad() {
        self.joinButton.isEnabled = false
        self.hideKeyboardWhenTappedAround()
        for textField in textFields { textField.setBottomBorder() }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.accessibilityIdentifier == "Email" {
            presenter?.notifyEmailAddress(text: textField.text!)
        }
        presenter?.notifyTextChangedInTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField .resignFirstResponder()
        return true
    }
    
    // MARK: - callback
    func getJoinViewModel() -> JoinViewModel {
        return JoinViewModel(
            firstName: firstNameLabel.text!,
            lastName: lastNameLabel.text!,
            email: emailLabel.text!,
            password: passwordLabel.text!
        )
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        presenter?.notifyLoginButtonTapped()
    }
    
    @IBAction func joinButtonTapped(_ sender: Any) {
        presenter?.notifyJoinButtonTapped()
    }
    
    @IBAction func termsOfServicesButtonTapped(_ sender: Any) {
       // presenter?.notifyTermsOfServicesTapped()
    }
    
    @IBAction func facebookButtonTapped(_ sender: Any) {
       // presenter?.notifyFacebookButtonTapped()
    }
    
    @IBAction func googlePlusButtonTapped(_ sender: Any) {
       // presenter?.notifyGooglePlusButtonTapped()
    }
    
    func activateJoinButton() {
        DispatchQueue.main.async {
            self.joinButton.backgroundColor = UIColor.mezukaActiveGreen
            self.joinButton.isEnabled = true
            self.joinButton.isUserInteractionEnabled = true
        }
    }
    
    func deactivateJoinButton() {
        DispatchQueue.main.async {
            self.joinButton.backgroundColor = UIColor.mezukaPassiveGreen
            self.joinButton.isEnabled = false
        }
    }
    
    func displaySucceededMessage(message: String) {
       // self.showStylishSuccessMessage(message: message)
    }
    
    func displayErrorMessage(message: String) {
        //self.showStylishErrorMessage(message: message)
    }
}
