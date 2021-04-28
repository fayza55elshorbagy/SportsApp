//
//  URL.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
struct URLs {
    
    public static var getAllSports : String = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
    public static var getAllTeams : String = "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id="
    public static var getTeamDetails : String = "https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id="

    public static var getAllLeagues : String = "https://www.thesportsdb.com/api/v1/json/1/all_leagues.php"
    
     public static var getLeagueDetails : String = "https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id="
    
    
    
     public static let teamsInLeague = "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l="
    
      public static let passedEventsLeague = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="
    
      public static let comingEventFromSeason = "https://www.thesportsdb.com/api/v1/json/1/eventsround.php?id="

    
}

