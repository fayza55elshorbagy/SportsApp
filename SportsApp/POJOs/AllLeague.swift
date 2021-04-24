//
//  AllLeague.swift
//  SportsApp
//
//  Created by fayza on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation

struct AllLeaguesResponse:Codable{
        var leagues:[AllLeague]?
    }
    struct AllLeague : Codable {
        
        var idLeague:String
        var strSport : String
    }

