//
//  Params.swift
//  WallpaperHD
//
//  Created by Nguyễn Quốc Trung on 9/2/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import Foundation


struct Params {
    
    static func createParamWallpaper(_ cat_id: String,_ page: String, _ fbclid: String)->Parameters{
        var params = Parameters()
        params.updateValue(cat_id, forKey: "cat_id")
        params.updateValue(page, forKey: "page")
        params.updateValue(fbclid, forKey: "fbclid")
        return params
    }
}
