//
//  EventsService.swift
//  SportsApp
//
//  Created by fayza on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
import Alamofire

class EventsService{
    
    
    func fetchEventsData(id:String,completion : @escaping ([[String:String?]]?, Error?)->()){
        
        AF.request("https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=\(id)").validate().responseDecodable(of : EventsResponse.self) {(response) in
             switch response.result {

                case .success( _):

                    guard let dataResponse = response.value else { return }

                    completion((dataResponse.events) ,nil)


                case .failure(let error):

                    completion(nil , error)


                }
        }}
    
}
