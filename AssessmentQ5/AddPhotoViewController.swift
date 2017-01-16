//
//  AddPhotoViewController.swift
//  AssessmentQ5
//
//  Created by LIN TINGMIN on 10/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class AddPhotoViewController: UIViewController {
    
    //create coredata constant
    let nameEntity = "Photo"

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    var isCancel = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check user allow to use camera
        if AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) == AVAuthorizationStatus.authorized{
            // show camera
            let controller = UIImagePickerController()
            //switch to pick picture from album
            controller.sourceType = .camera
            //controller.sourceType = .photoLibrary
            controller.delegate = self
            present(controller, animated: true, completion: nil)
            navigationController?.delegate = self
            
            //textfield delegate
            photoTextField.delegate = self
        }else{
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: { (granted) in
                if granted{
                    // show camera
                    let controller = UIImagePickerController()
                    //switch to pick picture from album
                    controller.sourceType = .camera
                    //controller.sourceType = .photoLibrary
                    controller.delegate = self
                    DispatchQueue.main.async {
                        self.present(controller, animated: true, completion: nil)
                    }
                    self.navigationController?.delegate = self
                    
                    //textfield delegate
                    self.photoTextField.delegate = self
                }else{
                    let alert = UIAlertController(title: "Failed to access camera", message: "Please agree to use camera in setting", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "ok", style: .default, handler: {
                        (action) in
                        self.isCancel = true
                        _ = self.navigationController?.popViewController(animated: true)
                    })
                    
                    alert.addAction(okAction)
                    DispatchQueue.main.async {
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                
                }
            })
            
        }
        

        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if(self.isMovingFromParentViewController) && !isCancel{
            
            //write data to coredata
            let context = DataManger.share.mainContext
            let photo:Photo
            if #available(iOS 10.0, *) {
                 photo = Photo(context: context)
            } else {
                 photo = NSEntityDescription.insertNewObject(forEntityName: nameEntity, into: context) as! Photo
                
            }
            photo.imageDS = photoTextField.text
            //turn image to data for saving in coreData
            guard let imagedata = UIImageJPEGRepresentation(photoImage.image!, 1) else{
                print("jpeg error")
                return
            }
            photo.image = NSData(data:imagedata)
            
            do {
                try context.save()
                
                if photo.objectID.isTemporaryID{
                    print("objectID is temporary")
                }else{
                    // get correct objectID. notify to update array
                    let newPhoto = PhotoData(photoImage: photoImage.image, photoDescription: photoTextField.text,id: photo.objectID)
                    NotificationCenter.default.post(name: NSNotification.Name("newPhoto"), object: nil, userInfo: ["photoData":newPhoto])
                }
            } catch {
                print("save failed")
            }
            
            
            
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
