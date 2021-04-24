//
//  LeagueDetailsViewModel.swift
//  SportsApp
//
//  Created by fayza on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation

class LeagueDetailsViewModel: NSObject {
    
    var leagueDetailsService :LeagueDetailsService!
   
    var leagueDetails : [League]! {
        didSet{
            
            self.bindLeagueDetailsViewModelToView()
        }
        
    }
    var showError : String! {
        
        didSet{
            
            self.bindViewModelErrorToView()
        }
        
    }
    
    var bindLeagueDetailsViewModelToView : (()->()) = {}
    var bindViewModelErrorToView : (()->()) = {}
    
    
    override init() {
        
        super .init()
        self.leagueDetailsService = LeagueDetailsService()
    }
    
    
    func fetchLeagueDetailsDataFromAPI (id:String){
        
        leagueDetailsService.fetchLeagueDetailsData(id: id, completion: { (league, error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                
                self.leagueDetails = league
                
            }
           
        })
    }

}


