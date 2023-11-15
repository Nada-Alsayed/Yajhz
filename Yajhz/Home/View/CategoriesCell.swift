//
//  CategoriesCell.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    //MARK: - IBOutlets

    @IBOutlet weak var bg_view: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    func setupUI(){
        // Apply corner radius
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        // Apply shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }

}
