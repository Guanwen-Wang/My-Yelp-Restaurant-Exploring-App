//
//  RestaurantTableViewCell.swift
//  ece564-proj
//
//  Created by Guanwen Wang on 10/29/19.
//  Copyright © 2019 Duke University. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantTableViewCell: UITableViewCell {

    
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with viewModel: RestaurantListViewModel) {
        restaurantImage.af_setImage(withURL: viewModel.imageUrl!)
        restaurantNameLabel.text = viewModel.name
        locationLabel.text = viewModel.formattedDistance
    }

}
