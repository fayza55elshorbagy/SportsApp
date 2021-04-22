//
//  AllLeagues.swift
//  SportsApp
//
//  Created by fayza on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation

class AllLeagues {
        var idLeague : String?
        var strLeague :String?
        var strLeagueThumb : String?
        var strYoutube : String?

    init(idLeague : String,strLeague : String,strLeagueThumb:String,strYoutube:String) {
        self.idLeague=idLeague as? String
        self.strLeague=strLeague as? String
        self.strLeagueThumb = strLeagueThumb as? String
        self.strYoutube = strYoutube as? String
    }
}
