//
//  API.swift
//  WallpaperHD
//
//  Created by Nguyễn Quốc Trung on 9/2/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String:Any]
public typealias JSON = [String:AnyObject]

struct API {
    
    static func requestDataWith(_ urlString: String,_ header: HTTPHeaders?,_ param: Parameters?,_ httpMethod: HTTPMethod,_ completion:((_ data:Data?,_ error:String?,_ code:Int?)->Void)?) {
        
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url)
        
        if let header = header {
            for (key,value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        request.httpMethod = httpMethod.rawValue
        
        if let param = param {
            let body = try! JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
            request.httpBody = body
        }
        
        let task = URLSession.shared.dataTask(with: request) { (Data, URLResponse, Error) in
            if let error = Error {
                completion!(nil, error.localizedDescription, nil)
                return
            }
            guard let data = Data else { return }
            if let httpStatus = URLResponse as? HTTPURLResponse {
                completion!(data, "Success", httpStatus.statusCode)
            }
        }
        task.resume()
    }
}
