//
//  PopularNowCell.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import UIKit
import Cosmos

class PopularNowCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    //MARK: - IBOutlets
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var bg_view: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var favoriteImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    //MARK: - Methods

    func setupUI(){
        // Apply corner radius
        img.layer.cornerRadius = 20
        containerView.layer.cornerRadius = 20
        bg_view.layer.cornerRadius = 20
        bg_view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        layer.masksToBounds = false
        // Apply shadow
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 2, height: 2)
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowRadius = 5
        containerView.layer.shouldRasterize = true
        containerView.layer.rasterizationScale = UIScreen.main.scale
        
        
        favoriteImg.layer.masksToBounds = false
        favoriteImg.layer.shadowColor = UIColor.black.cgColor
        favoriteImg.layer.shadowOffset = CGSize(width: 2, height: 3)
        favoriteImg.layer.shadowOpacity = 0.8
        favoriteImg.layer.shadowRadius = 5
        favoriteImg.layer.shouldRasterize = true
        favoriteImg.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func configure(with ratingString: String) {
        if let ratingDouble = Double(ratingString) {
            cosmosView.rating = ratingDouble
        } else {
            print("Error: Unable to convert rating string to Double")
        }
    }

}
