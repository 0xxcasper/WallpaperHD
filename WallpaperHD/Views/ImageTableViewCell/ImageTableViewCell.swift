//
//  ImageTableViewCell.swift
//  WallpaperHD
//
//  Created by SangNX on 9/12/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import UIKit
import SDWebImage

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: BaseUIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var constantTop: NSLayoutConstraint!
    @IBOutlet weak var constantHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .clear
        imgView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(item: HD_WALLPAPER) {
        title.text = item.category_name
        line.layer.cornerRadius = 3
        guard let thumb = item.category_image else {
            imgView.setImageDefaults()
            return
        }
        imgView.setImage(url: thumb)
    }
    
}

extension ImageTableViewCell {
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    class var identifier: String {
        return String(describing: self)
    }
}
