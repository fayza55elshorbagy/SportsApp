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
     var yourobj : (() -> Void)? = nil

       @IBAction func btnAction(sender: UIButton)
       {
           if let btnAction = self.yourobj
           {
               btnAction()
             //  user!("pass string")
           }
       }
//
    var bRec:Bool = true

    @IBOutlet weak var youtubeButton: UIButton!
//    @IBAction func btnRec(_ sender: Any) {
//        bRec = !bRec
//        if bRec {
//            youtubeButton.setImage(UIImage(named: "MicOn.png"), for: .normal)
//        } else {
//            youtubeButton.setImage(UIImage(named: "MicOff.png"), for: .normal)
//        }
//    }
}
