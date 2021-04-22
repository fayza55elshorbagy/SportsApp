//
//  AllTeamsService.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
import Alamofire
class AllTeamsService{
    
    
    func fetchAllTeamsData(idd:String,completion : @escaping ([AllTeams]?, Error?)->()){
        
            
        let parameters: Parameters = ["id": Int(idd) ?? ""]
        AF.request(URLs.getAllTeams,method: .get,parameters: parameters)
            .validate()
            .responseDecodable(of: TeamsResponse.self) { (response) in
                switch response.result {
                
                case .success( _):   
                    
                    guard let dataResponse = response.value else { return }
                    
                    completion(dataResponse.teams,nil)
                    
                    
                case .failure(let error):
                    
                    completion(nil , error)
                    
                    
                }
            }
    }
}


