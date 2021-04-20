//
//  EventViewController.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
class EventViewController: UIViewController {

    var arrayOfAllTeams=[Teams]()

    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    func getAllTeams(urlFile:String,id:String) {
        
        let parameters: Parameters = ["id": Int(id) ?? ""]
        Alamofire.request(urlFile, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            if let error=response.error{
                    print("Error")
                }else if let jsonDict=response.result.value as? [String :Any]{
                    if let arr = jsonDict["teams"] as? [[String :Any]]{
                        for i in 0...arr.count-1 {
                            /*self.arrayOfAllTeams.append(Teams(idTeam: arr[i]["idTeam"] as! String,
                                                              strTeam: arr[i]["strTeam"] as! String,
                                                              strWebsite: arr[i]["strWebsite"] as! String,
                                                              strTeamLogo: arr[i]["strTeamLogo"] as! String,
                                                              strFacebook: arr[i]["strFacebook"] as! String,
                                                              strTwitter: arr[i]["strTwitter"] as! String,
                                                              strInstagram: arr[i]["strInstagram"] as! String,
                                                              strYoutube: arr[i]["strYoutube"] as! String))*/
                            self.arrayOfAllTeams.append(Teams(idTeam: arr[i]["idTeam"] as! String,
                                                              strTeamLogo: arr[i]["strTeamLogo"] as! String))
                            self.teamsCollectionView.reloadData()
                        }
                    }
                }
            }
 
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlFile="https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id="
        var id:String="4328"
        
        getAllTeams(urlFile: urlFile, id: id)
        


            //arrayOfAllSports=AllSportsApi().getAllSports()

        teamsCollectionView.dataSource=self
        teamsCollectionView.delegate=self

        // Do any additional setup after loading the view.
    }
    
}
extension EventViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfAllTeams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
        
        cell.img.contentMode = .scaleToFill
        cell.img.sd_setImage(with: URL(string: arrayOfAllTeams[indexPath.row].strTeamLogo), placeholderImage: UIImage(named: "M"))

        return cell
    }
    
}
extension EventViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrayOfAllTeams[indexPath.row].idTeam)
    }
}
