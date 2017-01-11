//
//  AddPhotoViewController.swift
//  AssessmentQ5
//
//  Created by LIN TINGMIN on 10/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import UIKit
import CoreData

class AddPhotoViewController: UIViewController {
    
    //create coredata constant
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let nameEntity = "Photo"

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // show camera 
        let controller = UIImagePickerController()
        //switch to pick picture from album
        //controller.sourceType = .camera
        controller.sourceType = .photoLibrary
        controller.delegate = self
        present(controller, animated: true, completion: nil)
        navigationController?.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if(self.isMovingFromParentViewController){
            
            //write data to coredata
            let photo = NSEntityDescription.insertNewObject(forEntityName: nameEntity, into: context) as! Photo
            photo.imageDS = photoTextField.text
            
            //turn image to data for saving in coreData
            guard let imagedata = UIImageJPEGRepresentation(photoImage.image!, 1) else{
                print("jpeg error")
                return
            }
            photo.image = NSData(data:imagedata)
            
            do {
                try context.save()
            } catch {
                print("save failed")
            }
            
            
            let newPhoto = PhotoData(photoImage: photoImage.image, photoDescription: photoTextField.text)
            NotificationCenter.default.post(name: NSNotification.Name("newPhoto"), object: nil, userInfo: ["photoData":newPhoto])
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
