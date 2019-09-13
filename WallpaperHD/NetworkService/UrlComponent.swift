//
//  UrlComponent.swift
//  WallpaperHD
//
//  Created by QUỐC on 9/4/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import Foundation

struct UrlComponent {
    
    static func createUrlComponentWallpaper(_ page: Int, _ cat_id: Int)-> UrlComponents {
        let components = [URLQueryItem(name: "cat_id", value: String(cat_id)),
                          URLQueryItem(name: "page", value: String(page))]
        return components
    }
    
    static func createUrlComponentWallpaperRecent(_ page: Int)-> UrlComponents {
        let components = [URLQueryItem(name: "latest", value: ""),
                          URLQueryItem(name: "page", value: String(page))]
        return components
    }
    
    static func createUrlCategoryList()-> UrlComponents {
        let components = [URLQueryItem(name: "cat_list", value: "")]
        return components
    }
}
