//
//  DetailViewController.swift
//  AssessmentQ5
//
//  Created by LIN TINGMIN on 12/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailScrollView: UIScrollView!
    @IBOutlet weak var photoDescriptionLabel: UILabel!
    var detailPhoto:PhotoData!
    var photoImageView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        photoImageView = UIImageView(frame: CGRect(x: (self.detailScrollView.frame.width/2) - 150 , y: 0, width: 300, height: 300))

        photoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: detailScrollView.frame.width, height: detailScrollView.frame.height))
        //detailScrollView.contentSize = detailScrollView.bounds.size
        
        photoImageView.image = detailPhoto.photoImage
        photoDescriptionLabel.text = detailPhoto.photoDescription
        detailScrollView.addSubview(photoImageView)
        
        detailScrollView.delegate = self
        detailScrollView.maximumZoomScale = 4
        detailScrollView.minimumZoomScale = 0.2
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
