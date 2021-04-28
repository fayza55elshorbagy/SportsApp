//
//  CustomCells.swift
//  SportsApp
//
//  Created by fayza on 4/27/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import SDWebImage


class passedEventCustomCell: UICollectionViewCell {
    

    @IBOutlet weak var homeImg: UIImageView!
    @IBOutlet weak var awayImg: UIImageView!
    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    
}

class teamsCutsomCell: UICollectionViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var backView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()


        self.backView.layer.borderWidth = 1
        self.backView.layer.cornerRadius = 25
        self.backView.clipsToBounds = true

    }
    
}

class upComingEventsCustomCell: UICollectionViewCell{
    @IBOutlet weak var backView: UIView!

    @IBOutlet weak var homeImg: UIImageView!
    @IBOutlet weak var awayImg: UIImageView!
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var awayName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()


        self.backView.layer.borderWidth = 1
        self.backView.layer.cornerRadius = 25
        self.backView.clipsToBounds = true

    }
    
}


