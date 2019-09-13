//
//  ImageTableView.swift
//  WallpaperHD
//
//  Created by SangNX on 9/13/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import UIKit

class LoadingImageView: BaseView {

    @IBOutlet weak var lbLoadingImage: UILabel!
    @IBOutlet weak var img_loading: UIImageView!
    let kRotationAnimationKey = "kRotationAnimationKey"
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func loading(){
        lbLoadingImage.text = "Đang tải hình ảnh..."
        _ = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(rotationLoading), userInfo: nil, repeats: true)
    }
    
    @objc func rotationLoading(){
        self.rotateView(view: self.img_loading)
    }
    
    func rotateView(view: UIView, duration: Double = 0.5) {
        if view.layer.animation(forKey: kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = -Float(.pi * 2.0)
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity
            view.layer.add(rotationAnimation, forKey: kRotationAnimationKey)
        }
    }

}
 
