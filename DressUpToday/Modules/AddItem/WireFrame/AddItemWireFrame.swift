
//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit

final class AddItemWireFrame: AddItemWireFrameProtocol {
    var view: UIViewController?
    
    class func setupAddItemModule() -> UIViewController {
        // Generating module components
        let storyboard = UIStoryboard(name: "AddItemView", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "StoryboardAddItemViewNavigation") as! UINavigationController
        let view: AddItemProtocol = navigation.topViewController as! AddItemView
        
        let presenter: AddItemPresenterProtocol & AddItemInteractorOutputProtocol = AddItemPresenter()
        let interactor: AddItemInteractorInputProtocol = AddItemInteractor()
        let localDataManager: AddItemLocalDataManagerInputProtocol = AddItemLocalDataManager() as AddItemLocalDataManagerInputProtocol
        let wireFrame: AddItemWireFrameProtocol = AddItemWireFrame()
        
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
}
