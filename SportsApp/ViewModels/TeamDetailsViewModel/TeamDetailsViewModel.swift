//
//  TeamDetailsViewModel.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
class TeamDetailsViewModel: NSObject {
    
    var teamDetailsService :TeamDetailsService!
    
    var team :OneTeam! {
        didSet{
            
            self.bindTeamDetailsViewModelToView()
        }
        
    }
    var showError : String! {
        
        didSet{
            
            self.bindViewModelErrorToView()
        }
        
    }
    
    var bindTeamDetailsViewModelToView : (()->()) = {}
    var bindViewModelErrorToView : (()->()) = {}
        
    
    override init() {
        
        super .init()
        self.teamDetailsService = TeamDetailsService()
        //self.fetchTeamDetailsDataFromAPI(idd: idd)
    }
    
    func seturl(idTeam:String)  {
        self.fetchTeamDetailsDataFromAPI(idd: idTeam)
    }
    func fetchTeamDetailsDataFromAPI (idd:String){
            
        teamDetailsService.fetchTeamDetailsData(idd: idd, completion: { (team, error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                
                self.team = team
                
            }
           
        })
    }

}


