//
//  AllSportsVieModel.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation

class AllSportsViewModel: NSObject {
    
    var allSportService :AllSportService!
    
    var allSports :[AllSports]! {
        didSet{
            
            self.bindAllSportsViewModelToView()
        }
        
    }
    var showError : String! {
        
        didSet{
            
            self.bindViewModelErrorToView()
        }
        
    }
    
    var bindAllSportsViewModelToView : (()->()) = {}
    var bindViewModelErrorToView : (()->()) = {}
    
    
    override init() {
        
        super .init()
        self.allSportService = AllSportService()
        self.fetchAllSportsDataFromAPI()
    }
    
    
    func fetchAllSportsDataFromAPI (){
        
        allSportService.fetchAllSportsData(completion: { (allSports, error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                
                self.allSports = allSports
                
            }
           
        })
    }

}

