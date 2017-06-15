//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation

final class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
    init() {}
    
    func notifyViewDidLoad() {
    }
    
    func notifySaveButtonTapped() {
        
    }
    
    func notifyDisLikeButtonTapped() {
        
    }
    
    func notifyAddNewButtonTapped() {
        
    }

}
