//
//  marketVC.swift
//  Video_editor
//
//  Created by 강병우 on 25/04/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import UIKit

class marketVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet var underLine_label: UILabel!
    @IBOutlet var saleGif: UIImageView!
    let cellId = "cellId"
    let imageArray = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7"),UIImage(named: "8"),UIImage(named: "9"),UIImage(named: "10"),UIImage(named: "11")]
    
    let CollectionV = UICollectionView(frame: CGRect.init(), collectionViewLayout: UICollectionViewLayout.init())
    override func viewDidLoad() {
        super.viewDidLoad()
        // 14000 세일 취소선
        strikethrough()
        saleGif.image = UIImage.gif(name: "sale")
    }
    override func viewWillAppear(_ animated: Bool) {
        setupCollectionView()
    }
    // function
    func setupCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 30)
        layout.itemSize = CGSize(width: self.view.frame.width * 0.7 , height: self.view.frame.height * 0.55)
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        CollectionV.collectionViewLayout = layout
        CollectionV.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        CollectionV.showsHorizontalScrollIndicator = false
        CollectionV.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        CollectionV.delegate = self
        CollectionV.dataSource = self
        //register
        CollectionV.register(MarketCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        // event
        let tap_CollectionV = UITapGestureRecognizer(target: self, action:  #selector(back(_:)))
        CollectionV.addGestureRecognizer(tap_CollectionV)
        self.view.addSubview(CollectionV)
        CollectionV.isHidden = true
    }
    // 취소선
    func strikethrough() {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "￦14,000")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        underLine_label.attributedText = attributeString
    }
    @objc func cancelBtnAction(_ :UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    @objc func back(_ :Any){
        CollectionV.isHidden = true
    }
    // 구매 알람창(Touch ID) 만들기
    func createCustimVC(ValueTitle: String, Price: String) -> UIViewController {
        let VC = UIViewController()
        let safeV = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        VC.view = safeV
        
        let Top_height = self.view.frame.height / 12 // 약 50
        let margin_x = Int(self.view.frame.width / 8)
        
        
        // TopView
        let TopView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: Top_height))
        TopView.layer.borderColor = UIColor.gray.cgColor
        TopView.layer.borderWidth = 0.5
        
        let AppStore_Label = UILabel(frame: CGRect(x: 20, y: 0, width: 120, height: 30))
        AppStore_Label.text = "App Store"
        AppStore_Label.font = UIFont.systemFont(ofSize: 25)
        AppStore_Label.center.y = TopView.frame.height / 2
        TopView.addSubview(AppStore_Label)
        
        let cancelBtn = UIButton(frame: CGRect(x: margin_x * 6 + 10, y: 0, width: 60, height: 20))
        cancelBtn.center.y = TopView.frame.height / 2
        cancelBtn.setTitle("취소", for: .normal)
        cancelBtn.setTitleColor(UIColor.blue, for: .normal)
        cancelBtn.addTarget(self, action: #selector(cancelBtnAction(_:)), for: .touchUpInside)
        TopView.addSubview(cancelBtn)
        
        // MidView1
        let MidView1 = UIView(frame: CGRect(x: 0, y: Top_height, width: self.view.frame.width, height: Top_height * 2))
        MidView1.layer.borderColor = UIColor.gray.cgColor
        MidView1.layer.borderWidth = 0.5
        
        let Img = UIImageView(frame: CGRect(x: 20, y: 0, width: 80, height: 80))
        Img.image = #imageLiteral(resourceName: "vimo_icon")
        Img.center.y = MidView1.frame.height / 2
        MidView1.addSubview(Img)
        
        let titleLabel = UILabel(frame: CGRect(x: 110, y: 0, width: 200, height: 15))
        titleLabel.text = ValueTitle
        titleLabel.center.y = (TopView.frame.height / 2) + 5
        MidView1.addSubview(titleLabel)
        
        let titleLabel2 = UILabel(frame: CGRect(x: 110, y: 0, width: 200, height: 50))
        titleLabel2.numberOfLines = 2
        titleLabel2.text = "VLLO \n앱 내 구입"
        titleLabel2.textColor = UIColor.gray
        titleLabel2.center.y = (TopView.frame.height / 2) + 35
        MidView1.addSubview(titleLabel2)
        
        // MidView2
        let MidView2 = UIView(frame: CGRect(x: 0, y: Top_height*3, width: self.view.frame.width, height: Top_height))
        MidView2.layer.borderColor = UIColor.gray.cgColor
        MidView2.layer.borderWidth = 0.5
        
        let AccountLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 120, height: 20))
        AccountLabel.text = "계정"
        AccountLabel.textColor = UIColor.gray
        AccountLabel.center.y = MidView2.frame.height / 2
        MidView2.addSubview(AccountLabel)
        
        let UserLabel = UILabel(frame: CGRect(x: 110, y: 0, width: 200, height: 20))
        UserLabel.text = "KBW2204@NAVER.COM"
        UserLabel.center.y = MidView2.frame.height / 2
        MidView2.addSubview(UserLabel)
        
        // MidView3
        let MidView3 = UIView(frame: CGRect(x: 0, y: Top_height*4, width: self.view.frame.width, height: Top_height))
        MidView3.layer.borderColor = UIColor.gray.cgColor
        MidView3.layer.borderWidth = 0.5
        
        let PriceListLabel = UILabel(frame: CGRect(x: 110, y: 0, width: 200, height: 20))
        PriceListLabel.text = "가격"
        
        PriceListLabel.center.y = MidView3.frame.height / 2
        MidView3.addSubview(PriceListLabel)
        
        let PriceLabel = UILabel(frame: CGRect(x: (margin_x * 5) + 10, y: 0, width: 200, height: 20))
        PriceLabel.text = Price
        PriceLabel.font = UIFont.systemFont(ofSize: 25)
        PriceLabel.center.y = MidView3.frame.height / 2
        MidView3.addSubview(PriceLabel)
        
        // BottomView
        let BottomView = UIView(frame: CGRect(x: 0, y: Top_height * 5, width: self.view.frame.width, height: Top_height*2))
        
        let TouchIdImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        TouchIdImg.image = #imageLiteral(resourceName: "touch_Id")
        TouchIdImg.center.x = (self.view.frame.width / 2) - 10
        TouchIdImg.center.y = (BottomView.frame.height / 2) - 20
        BottomView.addSubview(TouchIdImg)
        
        let TouchIdLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        TouchIdLabel.center.x = self.view.frame.width / 2
        TouchIdLabel.center.y = BottomView.frame.height / 2 + 25
        TouchIdLabel.text = "Touch ID로 결제"
        TouchIdLabel.font = UIFont.systemFont(ofSize: 20)
        BottomView.addSubview(TouchIdLabel)
        
        //        TopView.backgroundColor = UIColor.red
        //        MidView1.backgroundColor = UIColor.orange
        //        MidView2.backgroundColor = UIColor.yellow
        //        MidView3.backgroundColor = UIColor.green
        //        BottomView.backgroundColor = UIColor.blue
        safeV.addSubview(TopView)
        safeV.addSubview(MidView1)
        safeV.addSubview(MidView2)
        safeV.addSubview(MidView3)
        safeV.addSubview(BottomView)
        
        VC.preferredContentSize.width = self.view.frame.width
        VC.preferredContentSize.height = (self.view.frame.height / 12) * 7
        
        return VC
    }
    @IBAction func PurchaseButtonAction(_ sender: UIButton) {
        let Purchase_alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        let OkAction = UIAlertAction(title: "Ok", style: .default)
//        Purchase_alert.addAction(OkAction)
        // 주석
        if sender.titleLabel!.text == "￦9,900         " {
            let VC = createCustimVC(ValueTitle: "VLLO 풀 패키지", Price: "￦9,900")
            Purchase_alert.setValue(VC, forKey: "contentViewController")
        } else {
            let VC = createCustimVC(ValueTitle: "광고제거", Price: "￦3,900")
            Purchase_alert.setValue(VC, forKey: "contentViewController")
        }
    
        self.present(Purchase_alert, animated: true)
    }
    
    // 버튼 바구니 안에 버튼 클릭시
    @IBAction func ButtonAction(_ sender: UIButton) {
        CollectionV.isHidden = false
    }
    
    // 상태바 지우기
    override var prefersStatusBarHidden: Bool {
        return true
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MarketCollectionViewCell
        
        cell.img.image = imageArray[indexPath.row]
        
        return cell
        
    }
}
