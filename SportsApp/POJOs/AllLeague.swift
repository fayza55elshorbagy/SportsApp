//
//  AllLeague.swift
//  SportsApp
//
//  Created by fayza on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation


struct League : Codable {


        let idLeague : String?
        let strLeague : String?
        let strLeagueAlternate : String?
        let strSport : String?
       

        enum CodingKeys: String, CodingKey {
                case idLeague = "idLeague"
                case strLeague = "strLeague"
                case strLeagueAlternate = "strLeagueAlternate"
                case strSport = "strSport"
                
        }

}

struct LeagueAPI : Codable {
    let leagues : [League]?
}
