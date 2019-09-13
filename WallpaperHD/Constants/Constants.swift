//
//  Constants.swift
//  WallpaperHD
//
//  Created by Nguyễn Quốc Trung on 9/2/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    struct APIKey {
        static let devURL = "https://foriphone.net/php_web_services/api.php?latest&page=1&fbclid=IwAR1Efc5thS0r6Kw4GuhZ1eXHXRu6CEK4qoAtNu2eTDL4TmtC1U88S5j-LnQ"
        static let categoryURL = "https://foriphone.net/php_web_services/api.php?cat_list&fbclid=IwAR2vIEXkSglcKqKMkhWjSu2Ryb0-PzSNP3EejPL6Zl2yh6NUzOSGORw0_ag"
    }
    
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
}

let OK    = "OK"
let Error = "Error"
let Request_API_Fail = "Request API fail"
let Save_error = "Save error"
let Saved = "Saved"
let Save_Image_Success = "Image has been saved to your photos."
