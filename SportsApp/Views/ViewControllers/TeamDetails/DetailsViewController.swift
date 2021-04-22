//
//  DetailsViewController.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class DetailsViewController: UIViewController {
    
    var id:String="133604"
    let teamDetailsViewModel = TeamDetailsViewModel()

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var imglogo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    
    //var myTeam:OneTeam?

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // var id:String="133604"

        teamDetailsViewModel.bindTeamDetailsViewModelToView = {
                    
            self.onSuccessUpdateView()
            
        }
        teamDetailsViewModel.bindViewModelErrorToView = {
                    
            self.onFailUpdateView()
            
        }
        teamDetailsViewModel.idd=id

    }
    
    func onSuccessUpdateView(){
        
        let vvvvv = teamDetailsViewModel.team
        print(vvvvv)
        self.name.text=vvvvv?.strTeam
        self.country.text=vvvvv?.strCountry
        self.detail.text=vvvvv?.strDescriptionEN
        self.img.sd_setImage(with: URL(string: vvvvv!.strStadiumThumb), placeholderImage: UIImage(named: "placeholder.png"))
        self.imglogo.sd_setImage(with: URL(string: vvvvv!.strTeamLogo), placeholderImage: UIImage(named: "placeholder.png"))

 }
    
    func onFailUpdateView(){
        
       
        let alert = UIAlertController(title: "Error", message: teamDetailsViewModel.showError, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
        }
        
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }

    }
    
    func getAllTeams(urlFile:String,idTeam:String) {
        /*
        
        let parameters: Parameters = ["id": Int(idTeam) ?? ""]
        Alamofire.request(urlFile, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            if let error=response.error{
                    print("Error")
                }else if let jsonDict=response.result.value as? [String :Any]{
                    if let arr = jsonDict["teams"] as? [[String :Any]]
                    {
                        /*let teamDetails=OneTeam(idTeam: arr["idTeam"], strTeam: arr["strTeam"], intFormedYear: arr["intFormedYear"], strLeague: arr["strLeague"], strStadium: arr["strStadium"], strStadiumThumb: arr["strStadiumThumb"], strDescriptionEN: arr["strDescriptionEN"], strCountry: arr["strCountry"], strTeamLogo: arr["strTeamLogo"], strWebsite: arr["strWebsite"], strFacebook: arr["strFacebook"], strTwitter: arr["strTwitter"], strInstagram: arr["strInstagram"], strYoutube: arr["strYoutube"])
                        */
                        print("teamDetails")
                        self.name.text=arr[0]["strTeam"] as! String
                        self.country.text=arr[0]["strCountry"] as! String
                        self.detail.text=arr[0]["strDescriptionEN"] as! String
                        self.img.sd_setImage(with: URL(string: arr[0]["strStadiumThumb"] as! String), placeholderImage: UIImage(named: "placeholder.png"))
                        
                        self.imglogo.sd_setImage(with: URL(string: arr[0]["strTeamLogo"] as! String), placeholderImage: UIImage(named: "placeholder.png"))


                    }
                    else
                    {
                        print("ffffff")
                    }
                }
            }
*/
    }
 


