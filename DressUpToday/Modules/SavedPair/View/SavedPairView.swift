//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit

final class SavedPairView: UIViewController, SavedPairViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: SavedPairPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpCollectionView()
        self.activateBackIcon()
        self.presenter?.notifyViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(true, animated:false);
    }
    
    func displayErrorMessage(message: String) {
       //super.showErrorMessage(message: message)
    }
    
    // MARK: UiCollectionView DataSource & Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cellidentifier = String()
        cellidentifier = "SavedPairViewCell"
        collectionView.register(UINib.init(nibName: "SavedPairViewCell", bundle: nil), forCellWithReuseIdentifier: cellidentifier)
        var cell = SavedPairViewCell()
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath) as! SavedPairViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
    
    func setUpCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        var width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 2, left: 12, bottom: 12, right: 12)
        var countItems = CGFloat()
        countItems = 2
        var countItemSpasing = CGFloat()
        countItemSpasing = 12 * 3
        width = (self.view.frame.size.width - countItemSpasing)/countItems
        var height = CGFloat()
        height = width * (7/9.5)
        let size = CGSize(width: width + 2, height: height - 15)
        layout.itemSize = size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8
        collectionView.collectionViewLayout = layout
    }
}
