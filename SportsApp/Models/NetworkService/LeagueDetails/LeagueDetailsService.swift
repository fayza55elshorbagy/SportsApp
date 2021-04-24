//
//  LeagueDetails.swift
//  SportsApp
//
//  Created by fayza on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
import Alamofire

class LeagueDetailsService{
    
    
    func fetchLeagueDetailsData(id:String,completion : @escaping ([League]?, Error?)->()){
        
        AF.request("https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id=\(id)").validate().responseDecodable(of : LeagueDetailsResponse.self) {(response) in
             switch response.result {

                case .success( _):

                    guard let dataResponse = response.value else { return }

                    completion(dataResponse.leagues ,nil)


                case .failure(let error):

                    completion(nil , error)


                }
            }
    
    
//    let parameters: Parameters = ["id": Int(id) ?? ""]
//    AF.request(URLs.getLeagueDetails,method: .get,parameters: parameters)
//        .validate()
//        .responseDecodable(of: LeagueDetailsResponse.self) { (response) in
//            switch response.result {
//
//            case .success( _):
//
//                guard let dataResponse = response.value else { return }
//
//                completion(dataResponse.leagues,nil)
//
//
//            case .failure(let error):
//
//                completion(nil , error)
//
//
//            }
//        }
}


}
