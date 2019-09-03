//
//  UIView+Extension.swift
//  WallpaperHD
//
//  Created by QUỐC on 9/3/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func takeScreenshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            return image
        } else {
            return UIImage()
        }
    }
}
