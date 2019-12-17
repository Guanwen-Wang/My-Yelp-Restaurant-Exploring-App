//
//  CategoriesTableViewCell.swift
//  ece564-proj
//
//  Created by Chong Xu on 11/18/19.
//  Copyright © 2019 Duke University. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with rownum: Int) {
        if rownum == 0{
            self.label.text = "Asian"
            self.img.image=UIImage(named: "asianfusion")
        }
        if rownum == 1{
            self.label.text = "American"
            self.img.image=UIImage(named: "american")
        }
        if rownum == 2{
            self.label.text = "Mediterranean"
            self.img.image=UIImage(named: "med")
        }
        if rownum == 3{
            self.label.text = "Something Sweet"
            self.img.image=UIImage(named: "bakeries")
        }
        if rownum == 4{
            self.label.text = "Other Choices"
            self.img.image=UIImage(named: "other")
        }
    }


}
