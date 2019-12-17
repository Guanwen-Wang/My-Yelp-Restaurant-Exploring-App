//
//  detailTableViewCell.swift
//  ece564-proj
//
//  Created by Chong Xu on 11/18/19.
//  Copyright © 2019 Duke University. All rights reserved.
//

import UIKit

class detailTableViewCell: UITableViewCell {
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var priceSmall: UIImageView!
    @IBOutlet weak var ratingSmall: UIImageView!
    @IBOutlet weak var phoneSmall: UIImageView!
    
    @IBOutlet weak var top: UIImageView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with rownum: Int) {
        if rowstatus==0{
            if asianfusion.count != 0 {
                nameLabel.text = asianfusion[rownum].name
                ratingLabel.text = NSDecimalNumber(decimal: asianfusion[rownum].rating ?? 5).stringValue
                phoneLabel.text = asianfusion[rownum].phone
                priceLabel.text = asianfusion[rownum].price
                img.af_setImage(withURL: asianfusion[rownum].imageUrl!)
                priceSmall.image = UIImage(named: "Dollar")
                ratingSmall.image = UIImage(named: "rate")
                phoneSmall.image = UIImage(named: "phone")
                if NSDecimalNumber(decimal: asianfusion[rownum].rating ?? 0).doubleValue >= 4.0{
                    top.image = UIImage(named: "top")
                }
            }else{
                nameLabel.text = "Not Available"
                ratingLabel.text = "No Rating"
                phoneLabel.text = "No Phonenumber"
                priceLabel.text = "No Price"
                img.image=UIImage(named: "excl")
                priceSmall.image = UIImage(named: "Dollar")
                ratingSmall.image = UIImage(named: "rate")
                phoneSmall.image = UIImage(named: "phone")
                if NSDecimalNumber(decimal: asianfusion[rownum].rating ?? 0).doubleValue >= 4.0{
                    top.image = UIImage(named: "top")
                }
            }
        }
        if rowstatus == 1{
            if american.count != 0{
                nameLabel.text = american[rownum].name
                ratingLabel.text = NSDecimalNumber(decimal: american[rownum].rating ?? 5).stringValue
                phoneLabel.text = american[rownum].phone
                priceLabel.text = american[rownum].price
                img.af_setImage(withURL: american[rownum].imageUrl!)
                priceSmall.image = UIImage(named: "Dollar")
                ratingSmall.image = UIImage(named: "rate")
                phoneSmall.image = UIImage(named: "phone")
                if NSDecimalNumber(decimal: american[rownum].rating ?? 0).doubleValue >= 4.0{
                    top.image = UIImage(named: "top")
                }
            }
            else{
                nameLabel.text = "Not Available"
                ratingLabel.text = "No Rating"
                phoneLabel.text = "No Phonenumb"
                priceLabel.text = "No Price"
                img.image=UIImage(named: "excl")
                priceSmall.image = UIImage(named: "Dollar")
                ratingSmall.image = UIImage(named: "rate")
                phoneSmall.image = UIImage(named: "phone")
                if NSDecimalNumber(decimal: american[rownum].rating ?? 0).doubleValue >= 4.0{
                    top.image = UIImage(named: "top")
                }
            }
        }
        if rowstatus == 2{
            if med.count != 0{
                nameLabel.text = med[rownum].name
                ratingLabel.text = NSDecimalNumber(decimal: med[rownum].rating ?? 5).stringValue
                phoneLabel.text = med[rownum].phone
                priceLabel.text = med[rownum].price
                img.af_setImage(withURL: med[rownum].imageUrl!)
                priceSmall.image = UIImage(named: "Dollar")
                ratingSmall.image = UIImage(named: "rate")
                phoneSmall.image = UIImage(named: "phone")
                if NSDecimalNumber(decimal: med[rownum].rating ?? 0).doubleValue >= 4.0{
                    top.image = UIImage(named: "top")
                }
            }
            else{
                nameLabel.text = "Not Available"
                ratingLabel.text = "No Rating"
                phoneLabel.text = "No Phonenumb"
                priceLabel.text = "No Price"
                img.image=UIImage(named: "excl")
                priceSmall.image = UIImage(named: "Dollar")
                ratingSmall.image = UIImage(named: "rate")
                phoneSmall.image = UIImage(named: "phone")
                if NSDecimalNumber(decimal: med[rownum].rating ?? 0).doubleValue >= 4.0{
                    top.image = UIImage(named: "top")
                }
            }
        }
        if rowstatus == 3{
            if bakeries.count != 0{
                nameLabel.text = bakeries[rownum].name
                ratingLabel.text = NSDecimalNumber(decimal: bakeries[rownum].rating ?? 5).stringValue
                phoneLabel.text = bakeries[rownum].phone
                priceLabel.text = bakeries[rownum].price
                img.af_setImage(withURL: bakeries[rownum].imageUrl!)
                priceSmall.image = UIImage(named: "Dollar")
                ratingSmall.image = UIImage(named: "rate")
                phoneSmall.image = UIImage(named: "phone")
                if NSDecimalNumber(decimal: bakeries[rownum].rating ?? 0).doubleValue >= 4.0{
                    top.image = UIImage(named: "top")
                }
            }
            else{
                nameLabel.text = "Not Available"
                ratingLabel.text = "No Rating"
                phoneLabel.text = "No Phonenumb"
                priceLabel.text = "No Price"
                img.image=UIImage(named: "excl")
                priceSmall.image = UIImage(named: "Dollar")
                ratingSmall.image = UIImage(named: "rate")
                phoneSmall.image = UIImage(named: "phone")
                if NSDecimalNumber(decimal: bakeries[rownum].rating ?? 0).doubleValue >= 4.0{
                    top.image = UIImage(named: "top")
                }
            }
        }
        if rowstatus == 4{
            if other.count != 0 {
                nameLabel.text = other[rownum].name
                ratingLabel.text = NSDecimalNumber(decimal: other[rownum].rating ?? 5).stringValue
                phoneLabel.text = other[rownum].phone
                priceLabel.text = other[rownum].price
                img.af_setImage(withURL: other[rownum].imageUrl!)
                priceSmall.image = UIImage(named: "Dollar")
                ratingSmall.image = UIImage(named: "rate")
                phoneSmall.image = UIImage(named: "phone")
                if NSDecimalNumber(decimal: other[rownum].rating ?? 0).doubleValue >= 4.0{
                    top.image = UIImage(named: "top")
                }
            }
            else{
                nameLabel.text = "Not Available"
                ratingLabel.text = "No Rating"
                phoneLabel.text = "No Phonenumb"
                priceLabel.text = "No Price"
                img.image=UIImage(named: "excl")
                priceSmall.image = UIImage(named: "Dollar")
                ratingSmall.image = UIImage(named: "rate")
                phoneSmall.image = UIImage(named: "phone")
                if NSDecimalNumber(decimal: other[rownum].rating ?? 0).doubleValue >= 4.0{
                    top.image = UIImage(named: "top")
                }
            }
        }
    }


}
