//
//  ViewController.swift
//  WallpaperHD
//
//  Created by Nguyễn Quốc Trung on 9/2/19.
//  Copyright © 2019 Nguyễn Quốc Trung. All rights reserved.
//

import UIKit
import SDWebImage
import CoreImage

class ViewController: BaseViewController {
    //--->Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var btnRecent: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var containerView: UIView!
    //---->Data
    private lazy var wallpapers = [Wallpaper]()
    private var currentImage: UIImageView!
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromApi()
        setUpView()
        setUpCollectionView()
    }
    
    //MARK: SETUP VIEW
    private func setUpView() {
        slider.alpha = 0
        btnRecent.layer.cornerRadius = 12
        btnSave.layer.cornerRadius = 12
    }
    
    private func setUpCollectionView() {
        collectionView.register(ImageCollectionViewCell.nib, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.isPagingEnabled = true
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    //--->REQUEST API
    private func getDataFromApi() {
        DispatchQueue.main.async {self.showhub()}
        DataCenter.shared.callApiGetAllImageWallpaper(Constants.APIKey.devURL, nil, .get) { (Wallpapers) in
            if let wallpapers = Wallpapers {
                self.wallpapers = wallpapers
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    self.removeHub()
                }
            } else {
                DispatchQueue.main.async {
                    self.removeHub(complete: {
                        self.showAlerOneButton(title: Error, mess: Request_API_Fail, title_btn: OK)
                    })
                }
            }
        }
    }
    //--->HELPER FUNCTION
    private func animateShowSlider() {
        slider.value = 0.5
        currentImage.addBlurEffect()
        UIView.animate(withDuration: 0.3) {
            self.slider.alpha = 1
            self.btnRecent.alpha = 0
        }
    }
    
    private func animateHideSlider() {
        currentImage.removeBlurEffect()
        UIView.animate(withDuration: 0.3) {
            self.slider.alpha = 0
            self.btnRecent.alpha = 1
        }
    }
    //--->HANDLE SAVE IMAGE
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            DispatchQueue.main.async {
                self.removeHub(complete: {
                    self.showAlerOneButton(title: Save_error, mess: error.localizedDescription, title_btn: OK)
                })
            }
        } else {
            DispatchQueue.main.async {
                self.removeHub(complete: {
                    self.showAlerOneButton(title: Saved, mess: Save_Image_Success, title_btn: OK)
                })
            }
        }
        animateHideSlider()
    }
}
//MARK: - ACTIONS
extension ViewController {
    
    @IBAction func handleSlide(_ sender: UISlider) {
        if let blurredEffectView = currentImage.subviews.filter({$0 is UIVisualEffectView}).first {
            blurredEffectView.alpha = CGFloat(sender.value)
        }
    }
    
    @IBAction func handleEdit(_ sender: UIButton) {
        if self.slider.alpha == 0 {
            animateShowSlider()
        } else {
            animateHideSlider()
        }
    }
    @IBAction func handleRecent(_ sender: Any) {
        animateHideSlider()
    }
    
    @IBAction func handleSave(_ sender: UIButton) {
        DispatchQueue.main.async {self.showhub()}
        let img = self.containerView.takeScreenshot()
        UIImageWriteToSavedPhotosAlbum(img, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
}

//MARK: - COLLECTION VIEW DELEGATE - DATASOURCE
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wallpapers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        if let wallpaper_image = wallpapers[indexPath.row].wallpaper_image {
            cell.image.sd_setImage(with: URL(string: wallpaper_image), placeholderImage: #imageLiteral(resourceName: "placeholder"))
             if indexPath.row == 0 { currentImage = cell.image }
        }
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        animateHideSlider()
        let index = Int(scrollView.contentOffset.x/Constants.SCREEN_WIDTH)
        guard let cell = collectionView.cellForItem(at: IndexPath(row: index, section: 0)) else {return}
        if(cell is ImageCollectionViewCell) {
            currentImage = (cell as! ImageCollectionViewCell).image
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        animateHideSlider()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.SCREEN_WIDTH, height: Constants.SCREEN_HEIGHT)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
