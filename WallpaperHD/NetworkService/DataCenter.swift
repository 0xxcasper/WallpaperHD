//
//  DataCenter.swift
//  WallpaperHD
//
//  Created by Nguyễn Quốc Trung on 9/2/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import Foundation

let services = DataCenter.shared
struct DataCenter {
    
    static let shared = DataCenter()
    
    private func createHeader() -> HTTPHeaders {
        let _header: HTTPHeaders = ["Content-Type": "application/json"]
        return _header
    }
    
    func callApiGetAllImageWallpaper(_ url: String,_ components: UrlComponents,_ params: Parameters?,_ httpMethod: HTTPMethod, completion:((_ data: [Wallpaper]?)->Void)?){
        
        API.requestDataWith(url, nil, components, nil, httpMethod) { (Data, Error, Code) in
            if let data = Data {
                do {
                    let wallpapers = try JSONDecoder().decode(Wallpapers.self, from: data)
                    completion!(wallpapers.hD_WALLPAPER)
                } catch {
                    completion!(nil)
                }
            } else {
                completion!(nil)
            }
        }
    }
}

