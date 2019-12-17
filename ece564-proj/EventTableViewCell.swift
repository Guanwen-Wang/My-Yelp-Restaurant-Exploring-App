//
//  EventTableViewCell.swift
//  ece564-proj
//
//  Created by Yunhe Wang on 11/16/19.
//  Copyright © 2019 Duke University. All rights reserved.
//

import UIKit
import AlamofireImage

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventLocLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with viewModel: EventListViewModel) {
        eventImage.af_setImage(withURL: viewModel.imageUrl!) // force
        eventNameLabel.text = viewModel.name
        eventLocLabel.text = ""
        for addr in (viewModel.location?.displayAddress)! {
            eventLocLabel.text! += addr
        }
            
    }
}
