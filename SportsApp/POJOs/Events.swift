//
//  Events.swift
//  SportsApp
//
//  Created by fayza on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation


// MARK: - EventsResponse
struct Event : Codable {
    
    var strEvent : String?
    var strHomeTeam : String?
    var strAwayTeam : String?
    var intHomeScore : String?
    var intAwayScore : String?
    var dateEvent : String?
    var awayBadge: String?
    var strTime : String?
    var strSeason : String?
    var intRound : String?
}

struct EventAPI : Codable {
    var events : [Event]!
}

struct Teams : Codable {
    
    var strTeam : String?
    var strDescriptionEN : String?
    var strStadium : String?
    var strCountry : String?
    var strLeague : String?
    var strTeamBadge : String?
    var strStadiumThumb : String?
    var strTwitter : String?
    var strFacebook : String?
    var strInstagram : String?
    var idTeam : String?
}

struct TeamsAPI : Codable {
    var teams : [Teams]!
}

