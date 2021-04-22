//
//  Teams.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation

struct TeamsResponse : Codable{
    var teams:[AllTeams]?
}
struct AllTeams : Codable {
    
    var idTeam:String
    var strTeamLogo : String
}
