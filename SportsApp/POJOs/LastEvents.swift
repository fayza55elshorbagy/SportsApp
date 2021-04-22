//
//  LastEvents.swift
//  SportsApp
//
//  Created by fayza on 4/21/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
class LastEvents {
        var idEvent: String?
        var strEvent :String?
        var strEventThumb : String?
        var dateEvent : String?

    init(idEvent : String,strEvent : String,strEventThumb:String,dateEvent:String) {
        self.idEvent = idEvent as? String
        self.strEvent = strEvent as? String
        self.strEventThumb = strEventThumb as? String
        self.dateEvent = dateEvent as? String
    }
}
