//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit

protocol SavedPairViewProtocol: class {
    var presenter: SavedPairPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    //func displayErrorMessage(message: String)
    //func setVideoDetails(details: [HomeViewOutputModel])
}

protocol SavedPairWireFrameProtocol: class {
    weak var view: UIViewController? {get set}
    static func setupSavedPairModule() -> UIViewController
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
}

protocol SavedPairPresenterProtocol: class {
    var view: SavedPairViewProtocol? { get set }
    var interactor: SavedPairInteractorInputProtocol? { get set }
    var wireFrame: SavedPairWireFrameProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    func notifyViewDidLoad()
 }

protocol SavedPairInteractorOutputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}

protocol SavedPairInteractorInputProtocol: class {
    var presenter: SavedPairInteractorOutputProtocol? { get set }
    var localDataManager: SavedPairLocalDataManagerInputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
}

protocol SavedPairDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
}

protocol SavedPairLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
}
