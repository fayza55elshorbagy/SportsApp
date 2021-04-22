//
//  FavoriteCustomCell.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit

class FavoriteCustomCell: UITableViewCell {
    
    @IBOutlet weak var leagueTitle: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
    var yourobj : (() -> Void)? = nil
    
    @IBAction func btnAction(sender: UIButton)
    {
        if let btnAction = self.yourobj
        {
            btnAction()
          //  user!("pass string")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
