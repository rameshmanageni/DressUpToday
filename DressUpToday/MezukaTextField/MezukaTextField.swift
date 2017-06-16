//
//  MezukaTextField.swift
//  Mezuka
//
//
//

import UIKit
import Foundation

@IBDesignable class MezukaTextField: UIView, TextFieldProtocol, UITextFieldDelegate {
    
    // Our custom view from the XIB file
    var view: UIView!
    
    /**
     This member stores the uiButton action method
     */
    private var textChangedAction : () -> Void = {_ in }
    
    @IBOutlet weak var uiTextField: UITextField!
    
    /**
     This member stores input type of the MapiaTextField (Masking for Phone and Email),
     default value is te plain text
     */
    var inputType = EInputType.EMAIL
    /**
     This member shows this field is required or not
     */
    var isRequired = false
    
    func setTextChangedAction(action: @escaping () -> Void) {
        self.textChangedAction = action
    }
    
    /**
     Boolean variable used for making MapiaTextField is secure or not (hides or shows the password)
     */
    @IBInspectable var secureTextEntry:Bool {
        get{
            return uiTextField.isSecureTextEntry
        }
        set(secureTextEntry) {
            uiTextField.isSecureTextEntry = secureTextEntry
        }
    }
    
    /**
     Boolean variable used for making MapiaTextField is enabled or not
     */
    @IBInspectable var textEnabled:Bool {
        get{
            return uiTextField.isEnabled
        }
        set(textEnabled) {
            uiTextField.isEnabled = textEnabled
        }
    }
    
    /**
     String variable used for MapiaTextField placeholder
     */
    @IBInspectable var placeholder:String? {
        get{
            return uiTextField.placeholder
        }
        set(placeholder) {
            uiTextField.placeholder = placeholder
        }
    }
    
    /**
     String variable used for MapiaTextField input type (phone or email masking)
     */
    @IBInspectable var inputtype:String {
        get{
            return self.inputType.rawValue
        }
        set(inputtype) {
            switch inputtype {
            case EInputType.EMAIL.rawValue:
                self.inputType = EInputType.EMAIL
            case EInputType.PHONE.rawValue:
                self.inputType = EInputType.PHONE
            default:
                self.inputType = EInputType.DEFAULT
            }
        }
    }
    
    /**
     String variable used for MapiaTextField keyboard type
     */
    @IBInspectable var keyboardType: String{
        get{
            return self.keyboardType
        }
        set(keyboardType) {
            switch keyboardType {
            case EKeyboardType.NumberPad.rawValue:
                uiTextField.keyboardType = UIKeyboardType.numberPad
            case EKeyboardType.EmailAddress.rawValue:
                uiTextField.keyboardType = UIKeyboardType.emailAddress
            default:
                uiTextField.keyboardType = UIKeyboardType.default
            }
        }
    }
    
    /**
     This method calls the adjustValidationButton when text field is editing
     */
    @IBAction func uiTextFieldEditingChanged(_ sender: AnyObject) {
        textChangedAction()
    }
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MezukaTextField", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    /**
     Get text of the MapiaTextField
     - returns: returns text of the MapiaTextField
     */
    func getText() -> String! {
        if let _ = self.uiTextField.text {
            return self.uiTextField.text
        } else {
            return ""
        }
    }
   
    /**
     Clear text of the MapiaTextField
     */
    func clearText() {
        self.uiTextField.text = ""
    }

    /**
     Set text of the MapiaTextField and adjusts validation button
     - parameters:
     - text: The input text
     */
    func setInputText(text: String!) {
        uiTextField.text = text
        //  adjustValidationButton()
    }
    
    /**
     Validates the given text according to input type which can be Phone, Email or Default, if input text is empty returns valid(true)
     - returns: returns whether it is valid(true) or not(false)
     */
    func isValid() -> Bool {
        if getText().isEmpty { return true }
        let factory = ValidatorFactory()
        let validator = factory.create(type: inputType)
        return validator.isValid(text: getText())
    }
    
    /**
     Checks the given text is empty or not if it is required
     - returns: returns whether it is empty(true) or not(false)
     */
    func isEmpty() -> Bool {
        if self.isRequired && self.getText().isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
