//
//  CustomCollectionViewCell.swift
//  CustomLayout
//
//  Created by Di Wang on 2016/11/10.
//  Copyright © 2016年 Di Wang. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var photos: UIImageView!
    var indexForCell : NSIndexPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Additional Steps Below.
        self.photos = UIImageView()
        self.photos.frame.size = CGSize(width: 100, height: 100)
        self.photos.layer.cornerRadius = 50
        self.photos.clipsToBounds = true
        self.addSubview(self.photos)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
