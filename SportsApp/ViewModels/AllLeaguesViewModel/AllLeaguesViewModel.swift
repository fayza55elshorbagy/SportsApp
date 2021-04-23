//
//  AllLeaguesViewModel.swift
//  SportsApp
//
//  Created by fayza on 4/24/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation

class AllLeaguesViewModel{
    let leaguesService = AllLeaguesService()
    var allLeagues = [AllLeague]()
    var league = [League]()
    
    var errorMessage:String!{
        didSet{
         }
    }
    var leaguesDetailCompleted:[League]!{
        didSet{
//            print(leaguesDetails.count)
            self.bindLeaguesToView()
        }
    }
    
    var bindLeaguesToView:(()->())={}

    func getAllLeagues(sportName : String){
        leaguesService.getAllLeagues(sportName : sportName) { (leagues, error) in
            if let comingLeauges:[AllLeague] = leagues{
                self.allLeagues = comingLeauges
                print("count is \(self.allLeagues.count)")
                
                self.getAllLeaguesDetail()
            }else{
                print("NotWroking")
                print(error.debugDescription)
            }
        }
    }
    
    
    
    func getAllLeaguesDetail(){
        
        for league in allLeagues {
           
                leaguesService.getLeaugesDetail(leagueId: league.idLeague) { (leagueDetail, error) in
                    if let detail:League = leagueDetail{
                        self.league.append(detail)
                        print("dddddddd\(detail)")
                        //self.leaguesDetailCompleted = self.league
                        print("hhhhhhhhhhhhhhhhhhhhh")
                        print(detail.idLeague)
                        
                    }
                    print("Modsfjsfiluhdsuif")
                    print(self.league.count)
                }
            }
        
    }
}
