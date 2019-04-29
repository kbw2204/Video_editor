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
    
    @IBAction func PurchaseButtonAction(_ sender: UIButton) {
        
        let Purchase_alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
//        let OkAction = UIAlertAction(title: "Ok", style: .default)
//        Purchase_alert.addAction(OkAction)
        let VC = AlertVC()
        
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        v.backgroundColor = UIColor.red
        self.view = v
        self.preferredContentSize.height = 220
        let purchaseImage = UIImageView(frame: CGRect(x: 0, y: 40, width: 50, height: 50))
        purchaseImage.image = #imageLiteral(resourceName: "touch_Id")
        purchaseImage.center.x = (self.view.frame.width / 2) - 11.5
        let Touch_id_label = UILabel(frame: CGRect(x: 0, y: 10, width: 150, height: 80))
        Touch_id_label.center.x = (self.view.frame.width / 2) - 11.5
        Touch_id_label.text = "Touch ID로 결제"
        
        v.addSubview(purchaseImage)
        v.addSubview(Touch_id_label)
        VC.view = v
        Purchase_alert.setValue(VC, forKey: "contentViewController")
        self.present(Purchase_alert, animated: true)
    }
    
    // 버튼 바구니 안에 버튼 클릭시
    @IBAction func ButtonAction(_ sender: UIButton) {
 
        let Market_alert = UIAlertController(title: sender.currentTitle!, message: "클릭되었습니다", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        Market_alert.addAction(alertAction)
        present(Market_alert, animated: false, completion: nil)
    }
    
    // 상태바 지우기
    override var prefersStatusBarHidden: Bool {
        return true
    }


}
