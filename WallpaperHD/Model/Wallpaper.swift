//
//  Wallpaper.swift
//  WallpaperHD
//
//  Created by Nguyễn Quốc Trung on 9/2/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import Foundation

struct Wallpapers : Codable {
    
    let hD_WALLPAPER : [Wallpaper]?
    
    enum CodingKeys: String, CodingKey {
        
        case hD_WALLPAPER = "HD_WALLPAPER"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hD_WALLPAPER = try values.decodeIfPresent([Wallpaper].self, forKey: .hD_WALLPAPER)
    }
}

struct Wallpaper : Codable {
    
    let num : String?
    let id : String?
    let cat_id : String?
    let wallpaper_type : String?
    let wallpaper_image : String?
    let wallpaper_image_thumb : String?
    let total_views : String?
    let total_rate : String?
    let rate_avg : String?
    let wall_tags : String?
    let cid : String?
    let category_name : String?
    let category_image : String?
    let category_image_thumb : String?
    
    enum CodingKeys: String, CodingKey {
        
        case num = "num"
        case id = "id"
        case cat_id = "cat_id"
        case wallpaper_type = "wallpaper_type"
        case wallpaper_image = "wallpaper_image"
        case wallpaper_image_thumb = "wallpaper_image_thumb"
        case total_views = "total_views"
        case total_rate = "total_rate"
        case rate_avg = "rate_avg"
        case wall_tags = "wall_tags"
        case cid = "cid"
        case category_name = "category_name"
        case category_image = "category_image"
        case category_image_thumb = "category_image_thumb"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        num = try values.decodeIfPresent(String.self, forKey: .num)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        cat_id = try values.decodeIfPresent(String.self, forKey: .cat_id)
        wallpaper_type = try values.decodeIfPresent(String.self, forKey: .wallpaper_type)
        wallpaper_image = try values.decodeIfPresent(String.self, forKey: .wallpaper_image)
        wallpaper_image_thumb = try values.decodeIfPresent(String.self, forKey: .wallpaper_image_thumb)
        total_views = try values.decodeIfPresent(String.self, forKey: .total_views)
        total_rate = try values.decodeIfPresent(String.self, forKey: .total_rate)
        rate_avg = try values.decodeIfPresent(String.self, forKey: .rate_avg)
        wall_tags = try values.decodeIfPresent(String.self, forKey: .wall_tags)
        cid = try values.decodeIfPresent(String.self, forKey: .cid)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_image_thumb = try values.decodeIfPresent(String.self, forKey: .category_image_thumb)
    }
    
}
