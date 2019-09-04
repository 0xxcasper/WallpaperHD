//
//  UrlComponent.swift
//  WallpaperHD
//
//  Created by QUỐC on 9/4/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import Foundation


struct UrlComponent {
    
    static func createUrlComponentWallpaper(_ page: Int)-> UrlComponents {
        let components = [URLQueryItem(name: "cat_id", value: "42"),
                          URLQueryItem(name: "page", value: String(page)),
                          URLQueryItem(name: "fbclid", value: "IwAR3tDnyhYXteBZbHoTP4HG-KZZcDWSgM2ZGQQ1QZbR29xrojL6awb37Q_qI")]
        return components
    }
}
