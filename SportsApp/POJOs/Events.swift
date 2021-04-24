//
//  Events.swift
//  SportsApp
//
//  Created by fayza on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation


// MARK: - EventsResponse
struct EventsResponse: Codable {
    let events: [[String: String?]]
}

//struct EventsResponse:Codable{
//    var events:[Events]?
//}
//struct Events : Codable {
//
//    var idEvent: String
//    var strEvent :String
//    var strEventThumb : String
//    var dateEvent : String
//
//}

