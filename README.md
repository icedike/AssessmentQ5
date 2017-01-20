![](https://travis-ci.org/icedike/AssessmentQ5.svg?branch=master)  
# AssessmentQ5
![](https://github.com/icedike/AssessmentQ5/blob/master/README/camerax2.png)  

**Solution**  
1. Added a tableview with custom tableview cell. The custom cell contained a UIImage and a Label to save the photo user took and the description correspondingly.   
2. Tapped the plus button to make users take the picture. Check whether uses allowed to use the camera. If users don't allow to use the camera or cancel taking a photo, back to the previous view controller. Reference:<http://stackoverflow.com/questions/27646107/how-to-check-if-the-user-gave-permission-to-use-the-camera>   
3. Use notification center to inform table view to update data of the cell when user taped back button.  
4. Use scroll view controller to zoom the image. Reference:<http://www.appcoda.com.tw/uiscrollview-introduction/>  
5. Use UIActivityViewController to handle the share function. Reference:<http://www.appcoda.com.tw/social-framework-introduction/>  
6. Use CoreData to save, delete photos. Have the ability to keep data. Reference:<http://www.swiftcoder.club/swift-3-core-data-operations/>

**Objects**  
UIViewController, NavigationViewController, UITableView, UIImagePickerController, CoreData, NotificationCenter, ScrollView, UIActivityViewController, UIAlertViewController.

**Demo**  
![](https://github.com/icedike/AssessmentQ5/blob/master/README/takePhoto.gif)
![](https://github.com/icedike/AssessmentQ5/blob/master/README/zoomShare.gif)


[**Available on the Apple Store:私密相簿**](https://itunes.apple.com/us/app/si-mi-xiang-bu/id1194567359?ls=1&mt=8)  
