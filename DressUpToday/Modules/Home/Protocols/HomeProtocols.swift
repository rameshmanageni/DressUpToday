//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    //func displayErrorMessage(message: String)
    //func setVideoDetails(details: [HomeViewOutputModel])
}

protocol HomeWireFrameProtocol: class {
    weak var view: UIViewController? {get set}
    static func setupHomeModule() -> UIViewController
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
}

protocol HomePresenterProtocol: class {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    func notifyViewDidLoad()
    func notifySaveButtonTapped()
    func notifyDisLikeButtonTapped()
    func notifyAddNewButtonTapped()
 }

protocol HomeInteractorOutputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}

protocol HomeInteractorInputProtocol: class {
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDataManager: HomeLocalDataManagerInputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
}

protocol HomeDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
}

protocol HomeLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
}
