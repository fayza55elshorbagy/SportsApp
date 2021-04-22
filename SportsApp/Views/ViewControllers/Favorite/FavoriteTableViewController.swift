//
//  FavoriteTableViewController.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import SDWebImage
class FavoriteTableViewController: UITableViewController,UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var arrayOfFavoriteLeagues=[AllLeagues]()
    let favoriteViewModel = FavoriteViewModel()
    
    // search
    var filteredFavoriteLeagues=[AllLeagues]()
    var isFiliterd:Bool=false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        isFiliterd=false
        tableView.dataSource = self
        searchBar.delegate = self
        
        
        
        fetchAllFavoriteLeaguesFromCoreData()
        
                
        favoriteViewModel.bindAllFavoriteLeaguesViewModelToView = {
                    
            self.onSuccessUpdateView()
            
        }
        
        favoriteViewModel.bindViewModelErrorToView = {
                    
            self.onFailUpdateView()
            
        }        
    }
    
    func fetchAllFavoriteLeaguesFromCoreData (){
            
        FavoriteService().getFavoriteLeagues(completion: { (favoriteLeagues, error) in
            
            if let error : Error = error{
                let message = error.localizedDescription
            }else{
                self.arrayOfFavoriteLeagues = favoriteLeagues!
                self.tableView.reloadData()

            }
        
        })
        
    }
    
    func onSuccessUpdateView(){
        arrayOfFavoriteLeagues = favoriteViewModel.favoriteLeagues
        print(arrayOfFavoriteLeagues)
        print("ghsgdhbk")
        self.tableView.reloadData()
    }
    
    func onFailUpdateView(){
        
       
        let alert = UIAlertController(title: "Error", message: favoriteViewModel.showError, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
        }
        
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    func addToFavorite(favorite:AllLeagues)  {
        favoriteViewModel.addToFavorite(favorite: favorite)
    }
    func removeFromFavorite(idTeam:String) {
        favoriteViewModel.deleteFromFavorite(idTeam: idTeam)
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      /*  if isFiliterd {
            return filteredFavoriteLeagues.count
        }else{
            return arrayOfFavoriteLeagues.count
        }
 */
        return arrayOfFavoriteLeagues.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let leagueDetailView : LeagueDetailsTableViewController  = (self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsTableViewController"))! as! LeagueDetailsTableViewController
        //leagueDetailView.leagueId =  arrayOfAllLeaguesId[indexPath.row]
          //self.navigationController?.pushViewController(leagueDetailView, animated: true)
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteCustomCell
        
       /* if isFiliterd {
            cell.leagueTitle.text = filteredFavoriteLeagues[indexPath.row].strLeague
            cell.leagueImage.sd_setImage(with: URL(string: filteredFavoriteLeagues[indexPath.row].strLeagueThumb!), placeholderImage: UIImage(named: "M"))
        }else{
        
            cell.leagueTitle.text = arrayOfFavoriteLeagues[indexPath.row].strLeague
            cell.leagueImage.sd_setImage(with: URL(string: arrayOfFavoriteLeagues[indexPath.row].strLeagueThumb!), placeholderImage: UIImage(named: "M"))
        }
        cell.yourobj =
            {
                //Do whatever you want to do when the button is tapped here
                print("Pressed")
            }
 */
        cell.leagueTitle.text = arrayOfFavoriteLeagues[indexPath.row].strLeague
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 60
       }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0
        {
            isFiliterd = false;
        }
        else{
            isFiliterd = true;
          //  filteredFavoriteLeagues = searchText.isEmpty ? arrayOfFavoriteLeagues : arrayOfFavoriteLeagues.filter({(dataString : String) -> Bool in
           //     return dataString.range(of: searchText,options: .caseInsensitive) != nil
         //   })
            tableView.reloadData()

        }
    }
}


