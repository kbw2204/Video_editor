//
//  InquireVC.swift
//  Video_editor
//
//  Created by 강병우 on 25/04/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import UIKit

class InquireVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var SelectedImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func DeleteImage(_ sender: UIButton) {
        SelectedImage.setImage(#imageLiteral(resourceName: "nil_img"), for: .normal)
    }
    
    @IBAction func EditPicture(_ sender: UIButton) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: true)
    }
    
    
    
    
}
