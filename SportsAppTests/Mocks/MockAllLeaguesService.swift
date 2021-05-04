//
//  MockAllLeaguesService.swift
//  SportsAppTests
//
//  Created by fayza on 5/2/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
@testable import SportsApp

class MockAllLeaguesService {

    var shouldReturnError : Bool
    
    init(shouldReturnError : Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    var error : Error!
    let mockAllLeaguesJsonResponse : Array<[String:Any]> = [["idLeague":"4328","strLeague":"English Premier League","strSport":"Soccer","strLeagueAlternate":"Premier League"],["idLeague":"4329","strLeague":"English League Championship","strSport":"Soccer","strLeagueAlternate":"Championship"]]
    
    let mockAllLeagueDetailsResponse : [String:Any] = ["idLeague":"4329","idSoccerXML":"null","idAPIfootball":"2794","strSport":"Soccer","strLeague":"English League Championship","strLeagueAlternate":"Championship","strDivision":"2","idCup":"0","strCurrentSeason":"2020-2021","intFormedYear":"2004","dateFirstEvent":"1892-09-03","strGender":"Male","strCountry":"England","strWebsite":"www.football-league.co.ukpage or the Sky Bet Championship for sponsorship reasons) is the second-highest division overall in the English football league system after the Premier League. Each year, the top finishing teams in the Championship are promoted to the Premier League, and the lowest finishing teams are relegated.\r\n\r\nThe Football League Championship, which was introduced for the 2004–05 season, was previously known as the Football League First Division (1992–2004), and before that was known as Division Two (1892–1992). The winners of the Championship receive the Football League Championship trophy, the same trophy as the old First Division champions were handed prior to the Premier League's inception in 1992.\r\n\r\nThe Championship is the wealthiest non-top flight football division in the world and the seventh richest division in Europe. The average match attendance for the 2011–12 season was 17,738, which also makes it the most-watched secondary league in the world.\r\n\r\nIn the 2013–14 season, Leicester City were the division champions, Burnley were the runners up. At present (2014–15 season), Ipswich Town hold the longest tenure in the Championship, last being out of the division in the 2001–02 season when they were relegated from the Premier League."]
    
}
enum ResponseWithError : Error{
    case responseWithError
}

extension MockAllLeaguesService : NetworkServiceContracts{
    func getAllLeagues(sportName: String, completion: @escaping ([League]?, Error?) -> ()) {
        
        var allLeagues = [League]()
        
        do{
            let leaguesData = try JSONSerialization.data(withJSONObject: mockAllLeaguesJsonResponse, options: .fragmentsAllowed)
            allLeagues = try JSONDecoder().decode([League].self,from: leaguesData)
            
        }catch let error{
            
            print(error.localizedDescription)
            
        }
        
        if shouldReturnError{
            completion(nil,ResponseWithError.responseWithError)
        }
        else{
            completion(allLeagues,nil)
        }
        
    }
    
    func getLeaugesDetail(leagueId: String, completion: @escaping (LeaugeDetail?, Error?) -> ()) {
        
        
        var LeaguesDetails = LeaugeDetail()
        
        do{
            let leagueDetailsData = try JSONSerialization.data(withJSONObject: mockAllLeagueDetailsResponse, options: .fragmentsAllowed)
            LeaguesDetails = try JSONDecoder().decode(LeaugeDetail.self,from: leagueDetailsData)
            
        }catch let error{
            
            print(error.localizedDescription)
            
        }
        
        if shouldReturnError{
            completion(nil,ResponseWithError.responseWithError)
        }
        else{
            completion(LeaguesDetails,nil)
        }
        
    }
    
    
}
