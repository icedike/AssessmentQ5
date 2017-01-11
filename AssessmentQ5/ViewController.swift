//
//  ViewController.swift
//  AssessmentQ5
//
//  Created by LIN TINGMIN on 10/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageArray:[UIImage] = []
    var descriptionArray:[String] = []
    @IBOutlet weak var photoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    @IBAction func AddPhotoBtn(_ sender: UIBarButtonItem) {
//        let controller = UIImagePickerController()
//        controller.sourceType = .camera
//        controller.delegate = self
//        present(controller, animated: true) { 
//            let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddPhotoViewController") as! AddPhotoViewController
//            self.navigationController?.pushViewController(view, animated: true)
//        }
//    }


}

