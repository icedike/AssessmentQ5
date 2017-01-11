//
//  DataManager.swift
//  AssessmentQ5
//
//  Created by LIN TINGMIN on 12/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//


import UIKit
import CoreData

class DataManger{
    static let share = DataManger()
    lazy var mainContext:NSManagedObjectContext = {
        let mangerContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return mangerContext
    }()
}
