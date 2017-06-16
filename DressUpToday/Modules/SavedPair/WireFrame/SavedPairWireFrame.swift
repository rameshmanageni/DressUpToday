
//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit

final class SavedPairWireFrame: SavedPairWireFrameProtocol {
    weak var view: UIViewController?
    
    class func setupSavedPairModule() -> UIViewController {
        // Generating module components
        let storyboard = UIStoryboard(name: "SavedPairView", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "SavedPairView") as! SavedPairView
        
        let presenter: SavedPairPresenterProtocol & SavedPairInteractorOutputProtocol = SavedPairPresenter()
        let interactor: SavedPairInteractorInputProtocol = SavedPairInteractor()
        let localDataManager: SavedPairLocalDataManagerInputProtocol = SavedPairLocalDataManager() as SavedPairLocalDataManagerInputProtocol
        let wireFrame: SavedPairWireFrameProtocol = SavedPairWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDataManager = localDataManager
        wireFrame.view = view
        
        return view
    }
}
