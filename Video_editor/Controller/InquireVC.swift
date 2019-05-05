//
//  InquireVC.swift
//  Video_editor
//
//  Created by 강병우 on 25/04/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import UIKit
import UITextView_Placeholder

class InquireVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var SelectedImage: UIButton!
    @IBOutlet var TextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextView.font = UIFont.systemFont(ofSize: 12)
        TextView.placeholder = "Please enter your email address"
        
        
    }
    
    @IBAction func SendAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "전송하시겠습니까?", message: nil, preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "Yes", style: .default, handler: {action in self.dismiss(animated: true, completion: nil)})
        let CancelAction = UIAlertAction(title: "No", style: .cancel)
        alert.addAction(CancelAction)
        alert.addAction(OkAction)
        self.present(alert, animated: false)
    }
    @IBAction func DeleteImage(_ sender: UIButton) {
        SelectedImage.setImage(#imageLiteral(resourceName: "nil_img"), for: .normal)
    }
    
    @IBAction func EditPicture(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: true)
    }
    // 이미지 선택을 완료했을 때 호출되는 메소드

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImage: UIImage?
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImage = editedImage
            SelectedImage.setImage(selectedImage, for: .normal)
            picker.dismiss(animated: true, completion: nil)
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectedImage = originalImage
            SelectedImage.setImage(selectedImage, for: .normal)
            picker.dismiss(animated: true, completion: nil)
        }
        
    }
    
}
