//
//  AllSportService.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation

import Alamofire

class AllSportService{
    
    
    func fetchAllSportsData(completion : @escaping ([AllSports]?, Error?)->()){
        
        
        AF.request(URLs.getAllSports)
            .validate()
            .responseDecodable(of: AllSportsResponse.self) { (response) in
                switch response.result {
                
                case .success( _):
                    
                    guard let dataResponse = response.value else { return }
                    
                    completion(dataResponse.sports,nil)
                    
                    
                case .failure(let error):
                    
                    completion(nil , error)
                    
                    
                }
            }
    }
}

