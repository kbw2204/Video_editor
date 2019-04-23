//
//  ViewController.swift
//  Video_editor
//
//  Created by 강병우 on 18/04/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import UIKit
@IBDesignable

class ViewController: UIViewController {
    @IBOutlet weak var NavigationBar: UINavigationItem!
    @IBOutlet weak var Button_View: UIView!
    @IBOutlet weak var Button_View2: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 버튼뷰 제스쳐
        let Button_View_gesture = UITapGestureRecognizer(target: self, action:  #selector(self.Button_View_Action))
        
        let Button_View2_gesture = UITapGestureRecognizer(target: self, action:  #selector(self.Button_View2_Action))
        //제스쳐 등록
        self.Button_View.addGestureRecognizer(Button_View_gesture)
        self.Button_View2.addGestureRecognizer(Button_View2_gesture)
        
        
        
        
    }
    @objc func Button_View_Action(sender : UITapGestureRecognizer) {
        // Do what you want
        print("버튼 뷰 클릭됬습니다.")
    }
    @objc func Button_View2_Action(sender : UITapGestureRecognizer) {
        // Do what you want
        print("버튼 뷰2 클릭됬습니다.")
    }
    @IBAction func back_Action(_ segue: UIStoryboardSegue) {
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
extension UINavigationBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 101)
    }
}
