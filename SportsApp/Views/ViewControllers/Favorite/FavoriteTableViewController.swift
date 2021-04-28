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
    var arrayOfFavoriteLeagues=[LeaugeDetail]()
    let favoriteViewModel = FavoriteViewModel()
    var league = LeaugeDetail()
    // search
    var filteredFavoriteLeagues=[LeaugeDetail]()
    var isFiliterd:Bool=false
    var urlLink : String = ""
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
                self.filteredFavoriteLeagues = favoriteLeagues!
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
    func addToFavorite(favorite:LeaugeDetail)  {
        favoriteViewModel.addToFavorite(favorite: favorite)
    }
    func removeFromFavorite(idTeam:String) {
        favoriteViewModel.deleteFromFavorite(idTeam: idTeam)
        fetchAllFavoriteLeaguesFromCoreData()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiliterd {
            return filteredFavoriteLeagues.count
        }else{
            return arrayOfFavoriteLeagues.count
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueDetailView : LeagueDetailsViewController  = (self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController"))! as! LeagueDetailsViewController
        leagueDetailView.leagueId =  arrayOfFavoriteLeagues[indexPath.row].idLeague!
        if reachability.connection == .unavailable{
               showAlert(title:"Error",message:"No Internet Connection")
            
        }else{
         present(leagueDetailView, animated: true,completion: nil)
        }
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteCustomCell
        
        if isFiliterd {
            cell.leagueTitle.text = filteredFavoriteLeagues[indexPath.row].strLeague
            cell.leagueImage.sd_setImage(with: URL(string: filteredFavoriteLeagues[indexPath.row].strBadge!), placeholderImage: UIImage(named: "holder"))
        }else{
                cell.leagueTitle.text = arrayOfFavoriteLeagues[indexPath.row].strLeague
                cell.leagueImage.sd_setImage(with: URL(string: arrayOfFavoriteLeagues[indexPath.row].strBadge!), placeholderImage: UIImage(named: "holder"))
        }
        cell.yourobj =
            { if reachability.connection == .unavailable{
                self.showAlert(title:"Error",message:"No Internet Connection")

                }
            else{
                self.urlLink = self.arrayOfFavoriteLeagues[indexPath.row].strYoutube!
                self.performSegue(withIdentifier: "favorite", sender: self)
                print("Pressed")
                }
                
            }
 
        return cell
    }
    func showAlert(title:String,message:String)
       {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in}
               
           alert.addAction(okAction)
           self.present(alert, animated: true, completion: nil)
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let webView = segue.destination as! WebViewController
                
                if segue.identifier == "favorite"{
                    webView.link = "https://" + urlLink
                }
            }
  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            removeFromFavorite(idTeam: arrayOfFavoriteLeagues[indexPath.row].idLeague!)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
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
            filteredFavoriteLeagues=[]
            for item in arrayOfFavoriteLeagues {
                if (item.strLeague!.lowercased().contains(searchText.lowercased())) {
                    filteredFavoriteLeagues.append(item)
                }
            }
            tableView.reloadData()
        }
        tableView.reloadData()

    }
}
