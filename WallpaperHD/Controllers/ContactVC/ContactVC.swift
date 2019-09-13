//
//  ContactVC.swift
//  WallpaperHD
//
//  Created by SangNX on 9/13/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import UIKit

class ContactVC: BaseViewController {
    
    @IBOutlet weak var tableview: UITableView!
    let arr_title = ["Rate US", "More App"]
    let arr_img = ["heart", "gift"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        tableview.register(ContactTableViewCell.nib, forCellReuseIdentifier: ContactTableViewCell.identifier)
        tableview.delegate = self
        tableview.isScrollEnabled = false
        tableview.dataSource = self
        tableview.separatorStyle = .none
    }
    @IBAction func act_back(_ sender: Any) {
        self.dismiss()
    }
}

extension ContactVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath) as! ContactTableViewCell
        cell.setupCell(img: arr_img[indexPath.row], title: arr_title[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
