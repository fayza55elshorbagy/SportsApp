//
//  NetworkServiceContracts.swift
//  SportsApp
//
//  Created by fayza on 5/2/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation

protocol NetworkServiceContracts {
    
    func getAllLeagues(sportName : String, completion : @escaping ([League]?, Error?)->())
    
    func getLeaugesDetail(leagueId:String,completion : @escaping (LeaugeDetail?, Error?)->())
    
//    func getPassedEvents(leagueId:String,completion : @escaping ([Event]?, Error?)->())
//
//    func getTeamsInLeague(leagueStr:String,completion : @escaping ([Teams]?, Error?)->())
//
//    func getUpcomingEvents(_ leagueId: String,_ round:String,_ season:String, completion : @escaping ([Event]?, Error?)->())
//
//    func fetchAllTeamsData(idd:String,completion : @escaping ([AllTeams]?, Error?)->())
//
//    func fetchTeamDetailsData(idd:String,completion : @escaping (OneTeam?, Error?)->())
//
//    func fetchAllSportsData(completion : @escaping ([AllSports]?, Error?)->())

}
 
