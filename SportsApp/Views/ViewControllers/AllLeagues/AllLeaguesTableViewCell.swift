//
//  AllLeaguesTableViewCell.swift
//  SportsApp
//
//  Created by fayza on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit

class AllLeaguesTableViewCell: UITableViewCell {

     @IBOutlet weak var leagueTitle: UILabel!
     @IBOutlet weak var leagueImage: UIImageView!
  

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var youtubeButton: UIButton!
override func awakeFromNib() {
    super.awakeFromNib()


    self.backView.layer.borderWidth = 1
    self.backView.layer.cornerRadius = 25
    self.backView.clipsToBounds = true

}
    
    
}
