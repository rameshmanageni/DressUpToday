//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation

final class SavedPairPresenter: SavedPairPresenterProtocol, SavedPairInteractorOutputProtocol {
    weak var view: SavedPairViewProtocol?
    var interactor: SavedPairInteractorInputProtocol?
    var wireFrame: SavedPairWireFrameProtocol?
    
    init() {}
    
    func notifyViewDidLoad() {
    }
}
