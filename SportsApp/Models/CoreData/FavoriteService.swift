//
//  FavoriteService.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FavoriteService {
    var appDelegte: AppDelegate?
    var favoriteMngObj: NSManagedObject?
    
    init() {
        appDelegte = UIApplication.shared.delegate as? AppDelegate
    }
    
    func saveLeagueToFavorite(favoriteItem: AllLeagues) {
        print(favoriteItem)
        
        let context = appDelegte!.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Favorites", in: context)
        favoriteMngObj = NSManagedObject(entity: entity!, insertInto: context)
        
        favoriteMngObj?.setValue(favoriteItem.idLeague, forKey: "idLeague")
        favoriteMngObj?.setValue(favoriteItem.strLeague, forKey: "strLeague")
        favoriteMngObj?.setValue(favoriteItem.strLeagueThumb, forKey: "strLeagueThumb")
        favoriteMngObj?.setValue(favoriteItem.strYoutube, forKey: "strYoutube")
        
        do{
            try context.save()
            print("Saved")
        } catch {
            print("Not Saved")
        }
    }
    
    func deleteLeagueFromFavorite(idTeam:String) {

        let context = appDelegte!.persistentContainer.viewContext

        if let array = fetchData(){
                  for item in array {
                      if item.value(forKey: "idLeague") as! String == idTeam{
                          context.delete(item)
                          try?context.save()
                          print("deleted")
                      }
                  }
              }
          }
    func fetchData() -> [NSManagedObject]?{
        let context = appDelegte!.persistentContainer.viewContext

            let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Favorites")
            if let arr = try? context.fetch(fetchReq) {
                if arr.count > 0 {
                    return arr
                }
               return nil
            }else{
                return nil
            }
        }
    func getFavoriteLeagues(completion : @escaping ([AllLeagues]?, Error?)->()){
        var list = [AllLeagues]()
        let context = appDelegte!.persistentContainer.viewContext
       let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Favorites")
        do{
            let moviesMngObjArr = try context.fetch(fetchReq)
            for mngObj in moviesMngObjArr {
                let league = AllLeagues(idLeague: mngObj.value(forKey: "idLeague") as! String,
                           strLeague: mngObj.value(forKey: "strLeague") as! String,
                           strLeagueThumb: mngObj.value(forKey: "strLeagueThumb") as! String,
                           strYoutube: mngObj.value(forKey: "strYoutube") as! String)
                list.append(league)
            }
            completion(list,nil)
 
        }
 catch {
            print("gggggggg")
            completion(nil , error)
        }
    }

}
