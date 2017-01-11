//
//  ViewController.swift
//  AssessmentQ5
//
//  Created by LIN TINGMIN on 10/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

//    var imageArray:[UIImage] = []
//    var descriptionArray:[String] = []
    
    //create coredata constant
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let nameEntity = "Photo"
    
    var photoDataArray:[PhotoData] = []
    @IBOutlet weak var photoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register observer for adding new photo
        NotificationCenter.default.addObserver(self, selector: #selector(self.updatePhoto), name: NSNotification.Name("newPhoto"), object: nil)
        //tableView delegate & dataSource
        photoTableView.delegate = self
        photoTableView.dataSource = self
        
        //read data from coredata
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: nameEntity)
        do {
             let results = try context.fetch(request) as! [Photo]
            if results.count > 0 {
                print("\(results.count) saved in coredata")
                for result in results {
                    
                    let image = UIImage(data:(result.image as! Data))
                    let description = result.imageDS
                    let newPhoto = PhotoData(photoImage: image, photoDescription: description)
                    photoDataArray.append(newPhoto)
                }
            }
        } catch {
            print("read photo data failed")
        }
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        photoTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

