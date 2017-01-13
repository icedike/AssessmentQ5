//
//  PhotoData.swift
//  AssessmentQ5
//
//  Created by LIN TINGMIN on 11/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import UIKit
import CoreData

class PhotoData{
    var photoImage:UIImage?
    var photoDescription:String?
    var id:NSManagedObjectID
    init(photoImage:UIImage?, photoDescription:String?, id:NSManagedObjectID){
        self.photoImage = photoImage
        self.photoDescription = photoDescription
        self.id = id
    }
}
