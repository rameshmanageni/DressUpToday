//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit

final class HomeView: UIViewController, HomeViewProtocol {
    
    @IBOutlet weak var shirtImageView: UIImageView!
    @IBOutlet weak var pantImageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    var presenter: HomePresenterProtocol?
    var videoDetailsModelArray = [HomeViewOutputModel]()
    var pageNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.notifyViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(true, animated:false);
    }
    
    func displayErrorMessage(message: String) {
       //super.showErrorMessage(message: message)
    }
    
    @IBAction func onAddNewButtonTapped(_ sender: Any) {
        self.presenter?.notifyAddNewButtonTapped()
    }
    
    @IBAction func onSaveButtonTapped(_ sender: Any) {
        self.presenter?.notifySaveButtonTapped()
    }
    
    @IBAction func onDisLikeButtonTapped(_ sender: Any) {
        self.presenter?.notifyDisLikeButtonTapped()
    }
}
