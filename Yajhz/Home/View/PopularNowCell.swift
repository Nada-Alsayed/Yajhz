//
//  PopularNowCell.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import UIKit
import Cosmos

class PopularNowCell: UICollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var bg_view: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    
    @IBOutlet weak var rate: UILabel!
    
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
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    func configure(with ratingString: String) {
        if let ratingDouble = Double(ratingString) {
            cosmosView.rating = ratingDouble
        } else {
            print("Error: Unable to convert rating string to Double")
        }
    }

}
