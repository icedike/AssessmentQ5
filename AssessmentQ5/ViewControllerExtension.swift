//
//  ViewControllerExtension.swift
//  AssessmentQ5
//
//  Created by LIN TINGMIN on 10/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    //DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PhotoTableViewCell
        cell.cellPhotoImage.image = photoDataArray[indexPath.row].photoImage
        cell.cellPhotoLabel.text = photoDataArray[indexPath.row].photoDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController{
    func updatePhoto(notification:Notification){
        let info = notification.userInfo as! [String:PhotoData]
        let newPhoto = info["photoData"]!
        
        if photoDataArray.count == 0 {
            photoDataArray.append(newPhoto)
            DispatchQueue.main.async {
                self.photoTableView.reloadData()
            }
        }else{
            let index = IndexPath(row: 0, section: 0)
            photoDataArray.insert(newPhoto, at: 0)
            DispatchQueue.main.async {
                self.photoTableView.insertRows(at:[index], with: .fade)
            }
        }
        
    }
}
