//
//  DetailViewControllerExtension.swift
//  AssessmentQ5
//
//  Created by LIN TINGMIN on 12/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import UIKit

extension DetailViewController:UIScrollViewDelegate{
    //make photo zoom in & out
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
    //keep photo in center
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let imageViewSize = photoImageView.frame.size
        let scrollViewSize = scrollView.bounds.size
        
        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height)/2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width)/2 : 0
        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
        
    }
}

extension DetailViewController{
    func sharePhoto(){
        print("share photo")
        let shareItem :[Any] = [photoImageView.image!,photoDescriptionLabel.text!]
        let shareController = UIActivityViewController(activityItems: shareItem, applicationActivities: nil)
        shareController.popoverPresentationController?.sourceView = self.view
        present(shareController, animated: true, completion: nil)
    }
}
