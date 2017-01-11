//
//  AddPhotoViewController.swift
//  AssessmentQ5
//
//  Created by LIN TINGMIN on 10/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController {

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
