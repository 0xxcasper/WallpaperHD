//
//  UIImageView+Extenstion.swift
//  WallpaperHD
//
//  Created by Nguyễn Quốc Trung on 9/2/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView
{
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.5
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
    
    func removeBlurEffect() {
        let blurredEffectViews = self.subviews.filter{$0 is UIVisualEffectView}
        blurredEffectViews.forEach{ blurView in
            blurView.removeFromSuperview()
        }
    }
}
