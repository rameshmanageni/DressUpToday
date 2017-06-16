//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import MBProgressHUD

final class AddItemView: UIViewController, AddItemProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var presenter: AddItemPresenterProtocol?
    var clothType: String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print("documents :", documentsPath)
    }
    
    @IBAction func addItemButtonClicked(_ sender: Any) {
        let addItemButton : UIButton = sender as! UIButton
        self.presenter?.notifyAddItemButtonClicked()
        if addItemButton.tag == 1 {
            clothType = "P"
        } else {
            clothType = "S"
        }
    }
    
    // MARK: - AddItemPresenterProtocol
    func showChangeProfilePictureOptions() {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let takePhotoString = "Take Photo".localized(in: "EditProfilePictureView")
        let choosePhotoString = "Choose Existing Photo".localized(in: "EditProfilePictureView")

        let cancelString = "Cancel".localized(in: "EditProfilePictureView")
        let takePhotoAction = UIAlertAction(title: takePhotoString, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.presenter?.notifyTakePhotoSelected()
        })
        let choosePhotoAction = UIAlertAction(title: choosePhotoString, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.presenter?.notifyChooseExistingPhotoSelected()
        })
        
        let cancelAction = UIAlertAction(title: cancelString, style: .cancel, handler: nil)
        optionMenu.addAction(takePhotoAction)
        optionMenu.addAction(choosePhotoAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func openCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    func openGallery() {
        let imagePicker = UIImagePickerController()
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func displaySuccessMessage(message: String) {
        self.showStylishSuccessMessage(message: message)
    }
    
    func navigateBackToViewController() {
        (self.parent as? UINavigationController)?.popViewController(animated: true)
    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        presenter?.notifySaveData(image: pickedImage!, clothType: clothType!)
        /* ///-- fetch data from DB ---//
        let clothesData = self.fetchEntities()
        for cloth in clothesData {
            let obj = cloth as! Clothes
            let image = UIImage.init(data: obj.image! as Data)
            print(obj.objectID)
        }
        */
        dismiss(animated: true, completion: nil)
    }
    
    ///-- to fetch data from DB ---//
    func fetchEntities()->NSArray
    {
        var items: NSArray = []
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Clothes")
        let entetyDescription:NSEntityDescription = NSEntityDescription.entity(forEntityName: "Clothes", in: context)!
        fetchRequest.entity = entetyDescription
        fetchRequest.returnsObjectsAsFaults = false
        do {
            items = try context.fetch(fetchRequest) as NSArray
        } catch {
            print("error")
        }
        return items
    }
}
