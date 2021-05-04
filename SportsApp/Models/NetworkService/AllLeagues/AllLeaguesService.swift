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


class AllLeaguesService : NetworkServiceContracts{
    var allLeagues = [League]()

    func getAllLeagues(sportName : String, completion : @escaping ([League]?, Error?)->()){
        AF.request(URLs.getAllLeagues).validate().responseDecodable(of: LeagueAPI.self) { (response) in
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
    
    func getLeaugesDetail(leagueId:String,completion : @escaping (LeaugeDetail?, Error?)->()){
        let url = String("\(URLs.getLeagueDetails)\(leagueId)")
        AF.request(url).validate().responseDecodable(of: LeagueDetailAPI.self) { (response) in
                switch response.result {
                case .success( _):
                    guard let leagues = response.value?.leagues else { return }
                    completion(leagues[0],nil)
                case .failure(let error):
                    completion(nil , error)
                }
            }
    }
    
}
