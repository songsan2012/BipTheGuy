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

    @IBOutlet weak var uiImage: UIImageView!
    
    @IBOutlet weak var punchButton: UIButton!
    
    
    // -- Create Sound Support
    var audioPlayer: AVAudioPlayer!
    
    let punchSound = "punchSound"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // -- When the Image is pressed -- Start
    
    
    
    
    
    // -- When the Image is pressed -- End
    
    
    
    // -- When the Punch Button Pressed -- Start
    
        @IBAction func punchButtonPressed(_ sender: UIButton) {
            
            let originalButtonFrame = sender.frame
            let widthShrink: CGFloat = 30
            let heightShrink: CGFloat = 10
            
            
            // -- Animate the UI Image
            let originalImageFrame = uiImage.frame
            
            
            let smallerImageFrame = CGRect (
                x: uiImage.frame.origin.x + widthShrink,
                y: uiImage.frame.origin.y + heightShrink,
                width: uiImage.frame.width - (2 * widthShrink),
                height: uiImage.frame.height - (2 * heightShrink)
            )

            self.uiImage.frame = smallerImageFrame
            
            UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0 , animations: {
                self.uiImage.frame = originalImageFrame
                }
            )
            
            // -- Play the punch sound
            self.playSound("\(self.punchSound)")
            
        }
    
    // -- When the Punch Button Pressed -- Start
    
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
        
        let originalButtonFrame = uiImage.frame
        let widthShrink: CGFloat = 30
        let heightShrink: CGFloat = 10
        
        
        // -- Animate the UI Image
        let originalImageFrame = uiImage.frame
        
        
        let smallerImageFrame = CGRect (
            x: uiImage.frame.origin.x + widthShrink,
            y: uiImage.frame.origin.y + heightShrink,
            width: uiImage.frame.width - (2 * widthShrink),
            height: uiImage.frame.height - (2 * heightShrink)
        )

        self.uiImage.frame = smallerImageFrame
        
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0 , animations: {
            self.uiImage.frame = originalImageFrame
            }
        )
        
        // -- Play the punch sound
        self.playSound("\(self.punchSound)")
        
    }
    

}

