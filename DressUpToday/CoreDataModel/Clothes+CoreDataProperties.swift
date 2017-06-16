//
//  Clothes+CoreDataProperties.swift
//  
//
//  Created by Supriya on 16/06/17.
//
//

import Foundation
import CoreData


extension Clothes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Clothes> {
        return NSFetchRequest<Clothes>(entityName: "Clothes")
    }

    @NSManaged public var image: NSData?
    @NSManaged public var type: String?

}
