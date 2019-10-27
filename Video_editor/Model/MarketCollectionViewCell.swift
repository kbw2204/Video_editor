//
//  MarketCollectionViewCell.swift
//  Video_editor
//
//  Created by 강병우 on 30/05/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import UIKit

class MarketCollectionViewCell: UICollectionViewCell {
    
    var img : UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        img = UIImageView(frame: contentView.frame)

        contentView.addSubview(img)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


