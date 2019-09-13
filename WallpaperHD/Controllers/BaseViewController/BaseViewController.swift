//
//  BaseViewController.swift
//  WallpaperHD
//
//  Created by SangNX on 9/3/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import UIKit
let TAG_DIM_VIEW = 1000
let TAG_INDICATOR = 1001
class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlerOneButton(title: String, mess: String, title_btn: String) {
        let ac = UIAlertController(title: title, message: mess, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: title_btn, style: .cancel))
        present(ac, animated: true)
    }
    
    func dismiss() {
        guard let _ = self.navigationController?.popViewController(animated: true) else {
            self.dismiss(animated: true, completion: nil)
            return
        }
    }
    
    func showHub(title: String = "Loading"){
        DispatchQueue.main.async{
            let window : UIWindow = UIApplication.shared.keyWindow!
            let dimView: UIView = UIView()
            dimView.frame = window.frame
            dimView.backgroundColor = UIColor.black
            dimView.alpha = 0.4
            dimView.tag = TAG_DIM_VIEW
            window.addSubview(dimView)
            window.bringSubviewToFront(dimView)
            
            let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
            indicator.frame = CGRect(x: (window.frame.size.width - 50)/2, y: (window.frame.size.height - 50)/2, width: 50, height: 50)
            indicator.tintColor = .red
            window.addSubview(indicator)
            window.bringSubviewToFront(indicator)
            indicator.tag = TAG_INDICATOR
            indicator.startAnimating()
        }
    }
    
    func removeHub() {
        DispatchQueue.main.async{
            let window : UIWindow = UIApplication.shared.keyWindow!
            let dimview = window.viewWithTag(TAG_DIM_VIEW)
            dimview?.removeFromSuperview()
            let indicator = window.viewWithTag(TAG_INDICATOR)
            indicator?.removeFromSuperview()
        }
    }
}
