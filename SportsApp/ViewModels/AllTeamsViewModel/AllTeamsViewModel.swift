//
//  AllTeamsViewModel.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
class AllTeamsViewModel: NSObject {
    
    var allTeamsService :AllTeamsService!
    
    var allTeams :[AllTeams]! {
        didSet{
            
            self.bindAllTeamsViewModelToView()
        }
        
    }
    var showError : String! {
        
        didSet{
            
            self.bindViewModelErrorToView()
        }
        
    }
    
    var bindAllTeamsViewModelToView : (()->()) = {}
    var bindViewModelErrorToView : (()->()) = {}
    
    
    override init() {
        
        super .init()
        self.allTeamsService = AllTeamsService()
    }
    func setID(id:String) {
        self.fetchAllTeamsDataFromAPI(idd: id)

        
    }
    
    func fetchAllTeamsDataFromAPI (idd:String){
        
        allTeamsService.fetchAllTeamsData(idd: idd, completion: { (allTeams, error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                
                self.allTeams = allTeams
                
            }
           
        })
    }

}

