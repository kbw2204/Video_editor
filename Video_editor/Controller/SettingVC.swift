//
//  SettingVC_1.swift
//  Video_editor
//
//  Created by 강병우 on 25/04/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import UIKit

class SettingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: var
    @IBOutlet var SettingLabel: UILabel!
    @IBOutlet var SettingTableView: UITableView!
    
    struct settingList {
        let icon : UIImage
        let title : String
    }
    
    let list = [
        settingList(icon: #imageLiteral(resourceName: "shopCart"), title: "상점"),
        settingList(icon: #imageLiteral(resourceName: "star"), title: "평가 및 리뷰하기"),
        settingList(icon: #imageLiteral(resourceName: "video"), title: "VLLO youtube"),
        settingList(icon: #imageLiteral(resourceName: "instagram"), title: "VLLO 인스타그램"),
        settingList(icon: #imageLiteral(resourceName: "facebook"), title: "VLLO 팬 페이지"),
        settingList(icon: #imageLiteral(resourceName: "message"), title: "문의하기"),
        settingList(icon: #imageLiteral(resourceName: "Icon-eto-cc"), title: "CC 라이센스"),
    ]
    
    let cellId = "cellId1"
    
    //MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = SettingTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? SettingCell else {
            fatalError("settingCell dequeueReusableCell err")
        }
        cell.Setting_Label.text = list[indexPath.row].title
        cell.Setting_Image.image = list[indexPath.row].icon
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexNum = indexPath.row
        MvView(i: indexNum)
    }
    
    //MARK: - function
    func MvView(i: Int) {
        let youtube = "https://www.youtube.com/channel/UCvbmc3Bk4b_KSMxOi9-maNg"
        let instagram = "https://www.instagram.com/vllo_official/"
        let facebook = "https://m.facebook.com/1594140140821843"
        let cc = "https://creativecommons.org/licenses/by/4.0/"
        let review = "https://itunes.apple.com/kr/app/vllo-aka-vimo-video-editor/id952050883?l=en&mt=8"
        
        switch i {
        case 0:
            self.performSegue(withIdentifier: "marketSegue", sender: self)
        case 1:
           gotoUrl(url: review)
        case 2:
            gotoUrl(url: youtube)
        case 3:
            gotoUrl(url: instagram)
        case 4:
            gotoUrl(url: facebook)
        case 5:             // 문의하기
            self.performSegue(withIdentifier: "InquireSegue", sender: self)
        // cc 라이센스
        case 6:
            gotoUrl(url: cc)
        default:
            print("indexNum switch err")
        }
    }
    
    //사파리로 링크
    func gotoUrl(url : String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    //MARK: - IBAction
    @IBAction func backToSettings(_ segue: UIStoryboardSegue) {
    
    }
}

