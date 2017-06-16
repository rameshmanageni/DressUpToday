//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation

final class AddItemViewModel {
    
    var image: NSData!
    var clothType: String!
    
    init(image: NSData, clothType: String) {
        self.image = image
        self.clothType = clothType
    }
}
