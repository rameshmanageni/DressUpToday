
//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit

final class HomeWireFrame: HomeWireFrameProtocol {
    weak var view: UIViewController?
    
    class func setupHomeModule() -> UIViewController {
        // Generating module components
        let storyboard = UIStoryboard(name: "HomeView", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeView
        
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol = HomeInteractor()
        let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager() as HomeLocalDataManagerInputProtocol
        let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
        
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
