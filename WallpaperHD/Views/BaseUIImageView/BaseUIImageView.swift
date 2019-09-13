//
//  ImageTableView.swift
//  WallpaperHD
//
//  Created by SangNX on 9/13/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import UIKit

class BaseUIImageView: UIImageView {
    var viewLoading = LoadingImageView()
    var imageDefault: UIImage?
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async{
            self.addSubview(self.viewLoading)
            self.viewLoading.translatesAutoresizingMaskIntoConstraints = false
            self.viewLoading.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            self.viewLoading.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            self.viewLoading.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            self.viewLoading.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            self.viewLoading.loading()
        }
    }
    
    func setImageDefaults(){
        DispatchQueue.main.async{
            self.viewLoading.removeFromSuperview()
            self.image = #imageLiteral(resourceName: "placeholder")
            self.contentMode = .scaleAspectFit
        }
    }
    
    func setImage(url: String? = nil){
        guard let urlStr = url else{
            self.setImageDefaults()
            return
        }
        self.sd_setImage(with: URL(string: urlStr), completed: { [weak self] (image, error, type, url) in
            DispatchQueue.main.async{
                self?.viewLoading.removeFromSuperview()
                guard let _ = error else{
                    return
                }
                self?.image = #imageLiteral(resourceName: "placeholder")
            }
        })
    }
}


