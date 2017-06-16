//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit

final class AddItemInteractor: AddItemInteractorInputProtocol {
    weak var presenter: AddItemInteractorOutputProtocol?
    var localDataManager: AddItemLocalDataManagerInputProtocol?
    
    init() {}
    
    func saveEntities(image:UIImage, clothType:String) {
        let success = self.localDataManager?.saveEntities(image: image, clothType: clothType)
        presenter?.entitySaved(success: success!)
    }
    
    func fetchEntities() {
        
    }
    
    func fetchEntities(predicate:NSPredicate?) {
    }
}
