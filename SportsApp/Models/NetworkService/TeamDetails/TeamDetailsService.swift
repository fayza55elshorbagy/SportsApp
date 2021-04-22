//
//  TeamDetailsService.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation

import Alamofire

class TeamDetailsService{
    
    
    func fetchTeamDetailsData(idd:String,completion : @escaping (OneTeam?, Error?)->()){
        
        let parameters: Parameters = ["id": Int(idd) ?? ""]
        AF.request(URLs.getTeamDetails,method: .get,parameters: parameters)
            .validate()
            .responseDecodable(of: TeamDetailsResponse.self) { (response) in
                switch response.result {
                
                case .success( _):
                    
                    guard let dataResponse = response.value else { return }
                    
                    completion(dataResponse.teams![0],nil)
                    
                    
                case .failure(let error):
                    
                    completion(nil , error)
                    
                    
                }
            }
    }
}


