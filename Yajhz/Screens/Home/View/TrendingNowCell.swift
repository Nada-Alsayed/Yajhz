//
//  TrendingNowCell.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import UIKit

class TrendingNowCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var bg_view: UIView!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        // Apply corner radius
        bg_view.layer.cornerRadius = 20
        img.layer.cornerRadius = 20
        layer.masksToBounds = false
        // Apply shadow
        bg_view.layer.shadowColor = UIColor.black.cgColor
        bg_view.layer.shadowOffset = CGSize(width: 2, height: 2)
        bg_view.layer.shadowOpacity = 0.5
        bg_view.layer.shadowRadius = 5
        bg_view.layer.shouldRasterize = true
        bg_view.layer.rasterizationScale = UIScreen.main.scale
    }

}
