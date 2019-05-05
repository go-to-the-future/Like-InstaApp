//
//  ViewController.swift
//  Like-InstaApp
//
//  Created by Kiyoto Ryuman on 2019/05/05.
//  Copyright © 2019 Kiyoto Ryuman. All rights reserved.
//

import UIKit
import Photos
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    var saveImage:UIImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        PHPhotoLibrary.requestAuthorization{ (status) -> Void in
            
            switch(status){
                
            case .authorized: print("Authorized")
            case .denied: print("Denid")
            case .notDetermined: print("Not determined")
            case .restricted: print("Restricted")
            }
        }
    }

    @IBAction func cameracheck(_ sender: Any) {
        let sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.camera
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }else{
            print("エラー")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "next"){
            let subVC:FilterViewController = segue.destination as! FilterViewController
            subVC.passImage = saveImage
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if (info[.originalImage] as? UIImage) != nil {
             saveImage = info[.originalImage] as! UIImage
            
            picker.dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func album(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
}

