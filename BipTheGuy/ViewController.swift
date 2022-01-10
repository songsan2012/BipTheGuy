//
//  ViewController.swift
//  BipTheGuy
//
//  Created by song on 1/9/22.
//  Copyright © 2022 song. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    
    // -- Create Sound Support
        var audioPlayer: AVAudioPlayer!
        
        let punchSound = "punchSound"
    
    
    // -- Create ImagePicker support
    var imagePickerController = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        imagePickerController.delegate = self
        
    }
    
    
    // -- When the Image is pressed -- Start
    
    
    
    
    
    // -- When the Image is pressed -- End
    
    
    
    
    
    // -- When the Punch Button Pressed -- Start
    
    func showAlert(_ Title: String, _ Message: String) {
        
        let alertController = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
        @IBAction func cameraButtonPressed(_ sender: UIButton) {
            
//            showAlert("Alert Title here...", "You are awesome")
            
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {
                
                (_) in
                
                // TODO: Addin the Photo Library code later
                self.accessPhotoLibrary()
                
                
                print("You clicked Photo Library")
                }
            )
            
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
                
                (_) in
                
                // TODO: Add in the Camera code later
                self.accessCamera()
                
                print("You clicked Camera")
                }
            )
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            
            alertController.addAction(photoLibraryAction)
            alertController.addAction(cameraAction)
            alertController.addAction(cancelAction)
            
            
            present(alertController, animated: true, completion: nil)
            

        }
    
       func playSound(_ name: String) {
                       
                       if let sound = NSDataAsset(name: name) {
                           do {
                               try audioPlayer = AVAudioPlayer(data: sound.data)
                               audioPlayer.play()
                           }
                           catch
                           {
                               print("error")
                           }
                       }
                       else {
                           print("else")
                       }
                       
       }
         
    // -- When the Punch Button Pressed -- End
    
    @IBAction func imagePunchedTapped(_ sender: UITapGestureRecognizer) {
        
        let originalButtonFrame = imageView.frame
        let widthShrink: CGFloat = 30
        let heightShrink: CGFloat = 10
        
        
        // -- Animate the UI Image
        let originalImageFrame = imageView.frame
        
        
        let smallerImageFrame = CGRect (
            x: imageView.frame.origin.x + widthShrink,
            y: imageView.frame.origin.y + heightShrink,
            width: imageView.frame.width - (2 * widthShrink),
            height: imageView.frame.height - (2 * heightShrink)
        )

        self.imageView.frame = smallerImageFrame
        
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0 , animations: {
            self.imageView.frame = originalImageFrame
            }
        )
        
        // -- Play the punch sound
        self.playSound("\(self.punchSound)")
        
    }
    

}


// Add the support Extensions
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = editedImage
        }
        else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = originalImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func accessPhotoLibrary()
    {
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func accessCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerController.sourceType = .camera
            present(imagePickerController, animated: true, completion: nil)
        }
        else {
            showAlert("Camera Not Available", "There is no camera found")
        }

    }
    
}
