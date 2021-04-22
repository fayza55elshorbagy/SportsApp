//
//  OneTeam.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation

struct TeamDetailsResponse : Codable{
    var teams:[OneTeam]?
}
struct OneTeam : Codable {
    
    var idTeam:String
    var strTeam : String
    var intFormedYear:String
    var strLeague:String
    var strStadium:String
    var strStadiumThumb:String
    var strDescriptionEN:String
    var strCountry:String
    var strTeamLogo:String
    var strWebsite :String
    var strFacebook : String
    var strTwitter : String
    var strInstagram : String
    var strYoutube : String
}


