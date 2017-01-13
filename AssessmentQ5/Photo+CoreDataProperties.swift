//
//  Photo+CoreDataProperties.swift
//  AssessmentQ5
//
//  Created by LIN TINGMIN on 11/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo");
    }

    @NSManaged public var image: NSData?
    @NSManaged public var imageDS: String?

}
