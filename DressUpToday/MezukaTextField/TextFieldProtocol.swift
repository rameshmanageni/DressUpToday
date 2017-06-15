

import Foundation

/**
 It is a interface for text field
*/
protocol TextFieldProtocol {
    
    /**
     Validates the given text according to input type which can be Phone, Email or Default, when inputType is default it returns valid(true)
     - returns: returns whether it is valid(true) or not(false)
     */
    func isValid() -> Bool
    
    /**
     Checks the given text is empty or not if it is required
     - returns: returns whether it is empty(true) or not(false)
     */
    func isEmpty() -> Bool
}
