//
//  ViewController.swift
//  Video_editor
//
//  Created by 강병우 on 18/04/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import UIKit
@IBDesignable

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var NavigationBar: UINavigationItem!
    @IBOutlet weak var Button_View: UIView!
    @IBOutlet weak var Button_View2: UIView!
    @IBOutlet var gif_ImageView1: UIImageView!
    @IBOutlet var gif_ImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tap 제스쳐 등록
        addGesture()
        // gif
        gif_ImageView1.image = UIImage.gif(name: "vlloGif1")
        gif_ImageView2.image = UIImage.gif(name: "vlloGif2")
        // navigation title Gif
        
        navigationItem.titleView = UIImageView(image: UIImage.gif(name: "vlloTitle"))
        
    }
    
    // function
    func addGesture() {
        // 버튼뷰 제스쳐
        let tap_Button1 = UITapGestureRecognizer(target: self, action:  #selector(self.PhtoAction(_:)))
        let tap_Button2 = UITapGestureRecognizer(target: self, action:  #selector(self.PhtoAction(_:)))
        let tap_gif1 = UITapGestureRecognizer(target: self, action:  #selector(self.PhtoAction(_:)))
        let tap_gif2 = UITapGestureRecognizer(target: self, action:  #selector(self.PhtoAction(_:)))
        
        //제스쳐 등록
        Button_View.addGestureRecognizer(tap_Button1)
        Button_View2.addGestureRecognizer(tap_Button2)
        gif_ImageView1.addGestureRecognizer(tap_gif1)
        gif_ImageView2.addGestureRecognizer(tap_gif2)
        
        // 이미지뷰 터지 가능 옵션
        gif_ImageView1.isUserInteractionEnabled = true
        gif_ImageView2.isUserInteractionEnabled = true
    }
    
    // UIImagePicker
    @objc func PhtoAction(_ sender: UITapGestureRecognizer) {
        // Do what you want
        print("버튼 뷰 클릭됬습니다.")
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: true)
    }
    @IBAction func back_Action(_ segue: UIStoryboardSegue) {
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

//체리픽
