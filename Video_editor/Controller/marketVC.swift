//
//  marketVC.swift
//  Video_editor
//
//  Created by 강병우 on 25/04/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import UIKit

class marketVC: UIViewController {
    @IBOutlet var underLine_label: UILabel!
    @IBOutlet var saleGif: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 14000 세일 취소선
        strikethrough()
        saleGif.image = UIImage.gif(name: "sale")
    }
    // function
    // 취소선
    func strikethrough() {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "￦14,000")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        underLine_label.attributedText = attributeString
    }
    
    // 상태바 지우기
    override var prefersStatusBarHidden: Bool {
        return true
    }


}
