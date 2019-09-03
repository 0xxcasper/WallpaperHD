//
//  BaseViewController.swift
//  WallpaperHD
//
//  Created by SangNX on 9/3/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showhub() {
        Loading.Showloading(viewcontroller: self)
    }
    
    func removeHub(complete: (()->Void)? = nil) {
        self.dismiss(animated: true, completion: complete)
    }
    
    func showAlerOneButton(title: String, mess: String, title_btn: String) {
        let ac = UIAlertController(title: title, message: mess, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: title_btn, style: .default))
        present(ac, animated: true)
    }
    
}
