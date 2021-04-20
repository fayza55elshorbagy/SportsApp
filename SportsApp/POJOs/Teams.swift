//
//  Teams.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
class Teams {
        var idTeam:String
        var strTeamLogo : String
   
    // all Teams
    // https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=4328
    // 4328 ->  idLeague

    init(idTeam:String,strTeamLogo:String) {
        self.idTeam = idTeam
        self.strTeamLogo=strTeamLogo
    }
}
