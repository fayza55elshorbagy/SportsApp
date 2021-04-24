//
//  AllLeaguesService.swift
//  SportsApp
//
//  Created by fayza on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//
//

import Foundation
import Alamofire




class AllLeaguesService{
    var allLeagues = [AllLeague]()
    
    
    // MARK: - All Leagues
    func getAllLeagues(sportName : String, completion : @escaping ([AllLeague]?, Error?)->()){
        AF.request(URLs.getAllLeagues).validate().responseDecodable(of: AllLeaguesResponse.self) { (response) in
                switch response.result {
                case .success( _):
                    guard let leagues = response.value?.leagues else { return }
                    for league in leagues {
                        
                        if league.strSport == sportName {
                            self.allLeagues.append(league)
                        }
                    }
                    completion(self.allLeagues,nil)
                case .failure(let error):
                    completion(nil , error)
                }
            }
    }
    
    func getLeaugesDetail(leagueId:String,completion : @escaping (League?, Error?)->()){
        let url = String("\(URLs.getLeagueDetails)\(leagueId)")
        AF.request(url).validate().responseDecodable(of: LeagueDetailsResponse.self) { (response) in
                switch response.result {
                case .success( _):
                    guard let dataResponse = response.value else { return }
                    completion(dataResponse.leagues[0],nil)
                case .failure(let error):
                    completion(nil , error)
                }
            }
    }
}
