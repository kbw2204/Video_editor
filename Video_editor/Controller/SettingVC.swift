//
//  SettingVC.swift
//  Video_editor
//
//  Created by 강병우 on 24/04/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import UIKit

class SettingVC: UITableViewController {
    let cellIndentifier = "SettingCell_id"
    let list = [
        settingList(icon: #imageLiteral(resourceName: "shopCart"), title: "상점"),
        settingList(icon: #imageLiteral(resourceName: "star"), title: "평가 및 리뷰하기"),
        settingList(icon: #imageLiteral(resourceName: "video"), title: "VLLO youtube"),
        settingList(icon: #imageLiteral(resourceName: "instagram"), title: "VLLO 인스타그램"),
        settingList(icon: #imageLiteral(resourceName: "facebook"), title: "VLLO 팬 페이지"),
        settingList(icon: #imageLiteral(resourceName: "message"), title: "문의하기"),
        settingList(icon: #imageLiteral(resourceName: "cc"), title: "CC 라이센스"),
    ]
    struct settingList {
        let icon : UIImage
        let title : String
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    // MARK: - Table view data source

    // 셀 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell_id") as! SettingCell
        // 내용
        
        cell.SettingLabel.text = list[indexPath.row].title
        cell.SettingImg.image = list[indexPath.row].icon
        
        
        return cell
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
