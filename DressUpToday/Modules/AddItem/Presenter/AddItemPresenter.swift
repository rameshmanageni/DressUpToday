//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit

final class AddItemPresenter: AddItemPresenterProtocol, AddItemInteractorOutputProtocol {

    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    func notifyViewDidLoad() {

    }

    var view: AddItemProtocol?
    var interactor: AddItemInteractorInputProtocol?
    var wireFrame: AddItemWireFrameProtocol?
    
    init() {}
       
    func notifyAddItemButtonClicked() {
        view?.showChangeProfilePictureOptions()
    }
    
    func notifyTakePhotoSelected() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            view?.openCamera()
        } else {
            view?.displaySuccessMessage(message: "Camera not available")
        }
    }
    
    func notifyChooseExistingPhotoSelected() {
        view?.openGallery()
    }
    
    func notifySaveData(image: UIImage, clothType: String) {
        interactor?.saveEntities(image: image, clothType: clothType)
    }
    
    func entitySaved(success: Bool) {
        if success {
            view?.displaySuccessMessage(message: "Item added successfully")
        } else {
            view?.displaySuccessMessage(message: "Failuer")
        }
    }
}
