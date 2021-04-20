//
//  TeamsCollectionViewCell.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!

}


/*
 
 func getAllTeams(urlFile:String,idTeam:String) {
     
     let parameters: Parameters = ["id": Int(idTeam) ?? ""]
     Alamofire.request(urlFile, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
         if let error=response.error{
                 print("Error")
             }else if let jsonDict=response.result.value as? [String :Any]{
                 if let arr = jsonDict["teams"] as? [[String :Any]]
                 {
                     let teamDetails=OneTeam(idTeam: arr["idTeam"], strTeam: arr["strTeam"], intFormedYear: arr["intFormedYear"], strLeague: arr["strLeague"], strStadium: arr["strStadium"], strStadiumThumb: arr["strStadiumThumb"], strDescriptionEN: arr["strDescriptionEN"], strCountry: arr["strCountry"], strTeamLogo: arr["strTeamLogo"], strWebsite: arr["strWebsite"], strFacebook: arr["strFacebook"], strTwitter: arr["strTwitter"], strInstagram: arr["strInstagram"], strYoutube: arr["strYoutube"])
                     
                     print(teamDetails)
                 }
             }
         }

 }
 override func viewDidLoad() {
     super.viewDidLoad()
     
     let urlFile="https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id="
     var id:String="2563"
     
     getAllTeams(urlFile: urlFile, idTeam: id)
 }
 
}

 
 
 
 */
