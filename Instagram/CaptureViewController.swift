//
//  CaptureViewController.swift
//  Instagram
//
//  Created by Edison Lam on 3/12/17.
//  Copyright © 2017 Edison Lam. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    static let sourceCameraRoll:String = "SourceCameraRoll"
    static let sourceCamera:String = "SourceCamera"
    var source: String = CaptureViewController.sourceCameraRoll
    
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        submitBtn.layer.cornerRadius = 8
        submitBtn.layer.borderWidth = 1
        submitBtn.layer.borderColor = UIColor.blue.cgColor
        
        photoBtn.layer.cornerRadius = 8
        photoBtn.layer.borderWidth = 1
        photoBtn.layer.borderColor = UIColor.blue.cgColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if photoBtn.backgroundImage(for: UIControlState.normal) == nil {
            photoBtn.titleLabel?.text = "Tap To Take Or Select A Photo"
        } else {
            photoBtn.titleLabel?.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Do something with the images (based on your use case)
        //photoBtn.setImage(originalImage, for: UIControlState.normal)
        
        photoBtn.setBackgroundImage(originalImage, for: UIControlState.normal)
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onPhotoBtnPressed(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        
        if source != CaptureViewController.sourceCamera {
            print("\nUsing the Photo Library\n")
            vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        } else {
            print("\nUsing the camera\n")
            vc.sourceType = UIImagePickerControllerSourceType.camera
        }
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onSubmitBtnPressed(_ sender: Any) {
        Post.postUserImage(image: photoBtn.backgroundImage(for: UIControlState.normal), withCaption: captionTextField.text!) { (status:Bool, error: Error?) in
            if status {
                print("Made a post!")
                self.performSegue(withIdentifier: "segueFromCaptureToHome", sender: nil)
            } else {
                print("postUserImage Error : \(error?.localizedDescription)")
            }
        }
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
