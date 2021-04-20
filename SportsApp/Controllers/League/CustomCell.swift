//
//  CustomCell.swift
//  SportsApp
//
//  Created by fayza on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
class CustomCell : UITableViewCell {

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
}
