//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation

final class SavedPairInteractor: SavedPairInteractorInputProtocol {
    weak var presenter: SavedPairInteractorOutputProtocol?
    var localDataManager: SavedPairLocalDataManagerInputProtocol?
    
    init() {}
    
}
