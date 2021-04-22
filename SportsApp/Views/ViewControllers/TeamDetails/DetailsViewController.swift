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
        
        teamDetailsViewModel.seturl(idTeam:id)

        teamDetailsViewModel.bindTeamDetailsViewModelToView = {
                    
            self.onSuccessUpdateView()
            
        }
        teamDetailsViewModel.bindViewModelErrorToView = {
                    
            self.onFailUpdateView()
            
        }

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
    
 


