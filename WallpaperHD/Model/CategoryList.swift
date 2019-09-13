//
//  CategoryList.swift
//  WallpaperHD
//
//  Created by SangNX on 9/12/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import Foundation


struct CategoryList : Codable {
    let hD_WALLPAPER : [HD_WALLPAPER]?
    
    enum CodingKeys: String, CodingKey {
        
        case hD_WALLPAPER = "HD_WALLPAPER"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hD_WALLPAPER = try values.decodeIfPresent([HD_WALLPAPER].self, forKey: .hD_WALLPAPER)
    }
    
}


struct HD_WALLPAPER : Codable {
    let cid : String?
    let category_name : String?
    let category_image : String?
    let category_image_thumb : String?
    let category_total_wall : String?
    
    enum CodingKeys: String, CodingKey {
        
        case cid = "cid"
        case category_name = "category_name"
        case category_image = "category_image"
        case category_image_thumb = "category_image_thumb"
        case category_total_wall = "category_total_wall"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cid = try values.decodeIfPresent(String.self, forKey: .cid)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_image_thumb = try values.decodeIfPresent(String.self, forKey: .category_image_thumb)
        category_total_wall = try values.decodeIfPresent(String.self, forKey: .category_total_wall)
    }
    
}
