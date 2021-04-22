//
//  FavoriteViewModel.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
class FavoriteViewModel: NSObject {
    
    var favoriteService :FavoriteService!
    var bindAllFavoriteLeaguesViewModelToView : (()->()) = {}
    var bindViewModelErrorToView : (()->()) = {}
    
    var favoriteLeagues :[AllLeagues]! {
        didSet{
            
            self.bindAllFavoriteLeaguesViewModelToView()
        }
        
    }
    var showError : String! {
        
        didSet{
            
            self.bindViewModelErrorToView()
        }
        
    }
    
    override init() {
        
        super .init()
        self.favoriteService = FavoriteService()
        self.fetchAllFavoriteLeaguesFromCoreData()
    }
    
    func addToFavorite(favorite:AllLeagues) {
        favoriteService.saveLeagueToFavorite(favoriteItem: favorite)
    }
    func deleteFromFavorite(idTeam:String)  {
        favoriteService.deleteLeagueFromFavorite(idTeam:idTeam )
        
    }
    
    func fetchAllFavoriteLeaguesFromCoreData (){
            
        favoriteService.getFavoriteLeagues(completion: { (favoriteLeagues, error) in
            
            if let error : Error = error{
                let message = error.localizedDescription
                self.showError = message
                

                
            }else{
                self.favoriteLeagues = favoriteLeagues
                print("dghg")
                print(favoriteLeagues)

            }
        
        })
        
    }
}
