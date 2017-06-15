//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation
import UIKit

final class JoinWireFrame: JoinWireFrameProtocol {
    weak var view: UIViewController?
    
    class func setupJoinModule() -> UIViewController {
        // Generating module components
        let storyboard = UIStoryboard(name: "Join", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "StoryboardJoinView") as! JoinView
        
        let presenter: JoinPresenterProtocol & JoinInteractorOutputProtocol = JoinPresenter()
        let interactor: JoinInteractorInputProtocol = JoinInteractor()
        let localDataManager: JoinLocalDataManagerInputProtocol = JoinLocalDataManager()
        let wireFrame: JoinWireFrameProtocol = JoinWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDataManager = localDataManager
        wireFrame.view = view
        
        return view as UIViewController
    }
    
    func navigateToLoginModule() {
        (view?.parent as! UINavigationController).popViewController(animated: false)
    }
}
