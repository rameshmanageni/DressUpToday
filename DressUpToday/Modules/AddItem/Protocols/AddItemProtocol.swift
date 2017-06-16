//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemProtocol: class {
    var presenter: AddItemPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    func showChangeProfilePictureOptions()
    func openCamera()
    func openGallery()
    func navigateBackToViewController()    
    func displaySuccessMessage(message: String) 
}

protocol AddItemWireFrameProtocol: class {
    var view: UIViewController? {get set}
    static func setupAddItemModule() -> UIViewController
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
}

protocol AddItemPresenterProtocol: class {
    var view: AddItemProtocol? { get set }
    var interactor: AddItemInteractorInputProtocol? { get set }
    var wireFrame: AddItemWireFrameProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    func notifyViewDidLoad()
    func notifyAddItemButtonClicked()
    
    func notifyTakePhotoSelected()
    func notifyChooseExistingPhotoSelected()
    
    func notifySaveData(image: UIImage, clothType: String)
}

protocol AddItemInteractorOutputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    func entitySaved(success: Bool)
}

protocol AddItemInteractorInputProtocol: class {
    var presenter: AddItemInteractorOutputProtocol? { get set }
    var localDataManager: AddItemLocalDataManagerInputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func saveEntities(image:UIImage, clothType:String) 
}

protocol AddItemLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
    func saveEntities(image: UIImage, clothType: String) -> Bool
}
