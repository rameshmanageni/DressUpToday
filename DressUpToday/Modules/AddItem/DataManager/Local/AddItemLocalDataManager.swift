//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit
import CoreData

final class AddItemLocalDataManager: AddItemLocalDataManagerInputProtocol {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init() {}
    
    func saveEntities(image:UIImage, clothType:String)->Bool {
        let clothesObj = Clothes(context: context)
        clothesObj.type = clothType;
        clothesObj.image = UIImageJPEGRepresentation(image, 1)!as NSData;
        
        do {
            try clothesObj.managedObjectContext?.save()
            return true
        } catch {
            print(error)
        }
        return false
    }
    
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
    
    func fetchEntities(className:NSString, withPredicate predicate:NSPredicate?, managedObjectContext:NSManagedObjectContext) -> NSArray {
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
    
    func convertManagedObjectToModel(managedObjects: NSArray) {
        for object in managedObjects {
            var managedObject =  object as! Clothes
        }
    }
}
