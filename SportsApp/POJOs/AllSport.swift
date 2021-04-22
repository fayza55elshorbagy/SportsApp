//
//  AllSport.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/19/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation

struct AllSportsResponse:Codable{
    var sports:[AllSports]?
}
struct AllSports : Codable {
    
    var idSport : String
    var strSport :String
    var strSportThumb : String
    
    
    enum CodingKeys : String , CodingKey {
        
        case idSport = "idSport"
        case strSport = "strSport"
        case strSportThumb = "strSportThumb"
        
    }
}
