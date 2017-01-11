//
//  ViewController.swift
//  AssessmentQ5
//
//  Created by LIN TINGMIN on 10/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    var imageArray:[UIImage] = []
//    var descriptionArray:[String] = []
    
    var photoDataArray:[PhotoData] = []
    @IBOutlet weak var photoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updatePhoto), name: NSNotification.Name("newPhoto"), object: nil)
        photoTableView.delegate = self
        photoTableView.dataSource = self
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

