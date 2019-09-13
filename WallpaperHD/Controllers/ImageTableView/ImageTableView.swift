//
//  ImageTableView.swift
//  WallpaperHD
//
//  Created by SangNX on 9/12/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import UIKit

class ImageTableView: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var line: UIView!
    var listCatory: [HD_WALLPAPER] = []
    
    var Headerview : UIView!
    var NewHeaderLayer : CAShapeLayer!
    
    private let Headerheight : CGFloat = 250
    private let Headercut : CGFloat = 0
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        request()
    }
    
    func UpdateView() {
        tableView.backgroundColor = UIColor.white
        Headerview = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.rowHeight = UITableView.automaticDimension
        tableView.addSubview(Headerview)
        
        NewHeaderLayer = CAShapeLayer()
        NewHeaderLayer.fillColor = UIColor.black.cgColor
        Headerview.layer.mask = NewHeaderLayer
        
        let newheight = Headerheight - Headercut / 2
        tableView.contentInset = UIEdgeInsets(top: newheight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -newheight)
        
        self.Setupnewview()
    }
    func Setupnewview() {
        let newheight = Headerheight - Headercut / 2
        var getheaderframe = CGRect(x: 0, y: -newheight, width: tableView.bounds.width, height: Headerheight)
        if tableView.contentOffset.y < newheight {
            getheaderframe.origin.y = tableView.contentOffset.y
            getheaderframe.size.height = -tableView.contentOffset.y + Headercut / 2
        }
        Headerview.frame = getheaderframe
        let cutdirection = UIBezierPath()
        cutdirection.move(to: CGPoint(x: 0, y: 0))
        cutdirection.addLine(to: CGPoint(x: getheaderframe.width, y: 0))
        cutdirection.addLine(to: CGPoint(x: getheaderframe.width, y: getheaderframe.height))
        cutdirection.addLine(to: CGPoint(x: 0, y: getheaderframe.height - Headercut))
        NewHeaderLayer.path = cutdirection.cgPath
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tableView.decelerationRate = UIScrollView.DecelerationRate.fast
    }

    
    func setupView() {
        self.navigationController?.navigationBar.isHidden = true
        tableView.register(ImageTableViewCell.nib, forCellReuseIdentifier: ImageTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        line.layer.cornerRadius = 3
        UpdateView()
    }
    
    func request() {
        self.showHub()
        let components = UrlComponent.createUrlCategoryList()
        services.callApiGetAllImageWallpaperTable(Constants.APIKey.categoryURL, components, nil, .get) { (data) in
            DispatchQueue.main.async {
                (data != nil) ? (self.listCatory = data!) : (nil)
                self.tableView.reloadData()
                self.removeHub()
            }
        }
    }
    
    @IBAction func contact(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ContactVC") as! ContactVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension ImageTableView: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCatory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as! ImageTableViewCell
        cell.setupCell(item: listCatory[indexPath.row])
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.isRecent = false
        ViewController.cat_id = Int(listCatory[indexPath.row].cid!) ?? 42
        vc.titleButton = listCatory[indexPath.row].category_name ?? "Recent"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.Setupnewview()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0.4
        UIView.animate(withDuration: 0.2) {
            cell.alpha = 1
        }
    }

}
