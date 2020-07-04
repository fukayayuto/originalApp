//
//  WeatherCell.swift
//  originalApp1
//
//  Created by 深谷祐斗 on 2020/07/04.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var areaTextLabel: UILabel!
    
    @IBOutlet weak var IconLabel: UILabel!
    
    
    @IBOutlet weak var tempuretureLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var IconScrollView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
