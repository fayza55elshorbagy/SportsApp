//
//  OneTeam.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
class OneTeam {
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
            
    // team details
    // https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=2563
    // https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=2563
    // https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=2563
    // https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=2563
    // 2563 ->  idTeam
    

    init( idTeam:String,strTeam : String,     intFormedYear:String,     strLeague:String,     strStadium:String,     strStadiumThumb:String,
          strDescriptionEN:String,     strCountry:String,     strTeamLogo:String,     strWebsite :String,     strFacebook : String,     strTwitter : String,
          strInstagram : String,     strYoutube : String)
    {
        self.idTeam=idTeam
        self.strTeam=strTeam
        self.intFormedYear=intFormedYear
        self.strLeague=strLeague
        self.strStadium=strStadium
        self.strStadiumThumb=strStadiumThumb
        self.strDescriptionEN=strDescriptionEN
        self.strCountry=strCountry
        self.strTeamLogo=strTeamLogo
        self.strWebsite = strWebsite
        self.strFacebook = strFacebook
        self.strTwitter = strTwitter
        self.strInstagram = strInstagram
        self.strYoutube = strYoutube
    }

}

