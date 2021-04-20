//
//  AllSportsApi.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
import Alamofire

class AllSportsApi {
    var arrayOfAllSport=[AllSports]()
    var oneSport=AllSports(idSport: "", strSport: "", strSportThumb: "")

    func getAllSports()-> [AllSports] {
        DispatchQueue.main.sync {
            let urlFile="https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
            Alamofire.request(urlFile).validate().responseJSON {response in
                if let error=response.error{
                    print("Error")
                }else if let jsonDict=response.result.value as? [String :Any]{
                    if let arr = jsonDict["sports"] as? [[String :Any]]{
                        for i in 0...arr.count-1 {
                            self.oneSport.idSport=arr[i]["idSport"] as! String
                            self.oneSport.strSport=arr[i]["strSport"] as! String
                            self.oneSport.strSportThumb=arr[i]["strSportThumb"] as! String
                            self.arrayOfAllSport.append(self.oneSport)
                        }
                    }
                }
            }
        }
        return arrayOfAllSport
    }
}
