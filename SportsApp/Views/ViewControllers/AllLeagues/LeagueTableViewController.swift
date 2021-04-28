//
//  LeagueTableViewController.swift
//  SportsApp
//
//  Created by fayza on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class LeagueTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
let viewModel = AllLeaguesViewModel()
    var leagues = [LeaugeDetail]()
    var leaguesSearch = [LeaugeDetail]()
    var league = LeaugeDetail()
    var isFiltered = false
    var Strsport : String = "Soccer"
    
    var leagueIdPressed : String!
    var leagueStrPressed : String!
    var urlLink : String = "www.youtube.com/user/superleaguegreecenet"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        viewModel.bindLeaguesToView = {
            self.didReciveLeague()
        }
        viewModel.getAllLeagues(sportName: Strsport)
    }
    func didReciveLeague(){
        leagues = viewModel.leaguesDetailCompleted
        print("from view controller")
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltered {
            return leaguesSearch.count
        }
        return leagues.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueDetailScreen : LeagueDetailsViewController  = (self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController"))! as! LeagueDetailsViewController
        
        leagueIdPressed = leagues[indexPath.row].idLeague!
        leagueStrPressed = leagues[indexPath.row].strLeague!
        league = leagues[indexPath.row]
        
        leagueDetailScreen.leagueId = leagueIdPressed
        leagueDetailScreen.leagueStr = leagueStrPressed
        leagueDetailScreen.league = self.league
        
        
        
        present(leagueDetailScreen, animated: true, completion: nil)
    }
    
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesCell", for: indexPath) as! AllLeaguesTableViewCell
        
          cell.youtubeButton.addTarget(self, action: #selector(LeagueTableViewController.onClickedYoutubeButton), for: .touchUpInside)

        var league : LeaugeDetail!

           if isFiltered {
               league = leaguesSearch[indexPath.row]
           }else{
               league = leagues[indexPath.row]
           }
           
          cell.leagueTitle.text = league.strLeague
          self.urlLink = leagues[indexPath.row].strYoutube!
           if let imgStr = league.strBadge{
               cell.leagueImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
               cell.leagueImage.sd_setImage(with: URL(string: imgStr), placeholderImage: UIImage(named: "holder"))
           }
           return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let webView = segue.destination as! WebViewController
               
               if segue.identifier == "league"{
                   webView.link = "https://" + urlLink
               }
           }
   
     
    
    @objc func onClickedYoutubeButton(_ sender: Any?) {
        print(urlLink)
        self.performSegue(withIdentifier: "league", sender: self)
        print("tapped")
       
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63.0
    }
    
    

}


     extension LeagueTableViewController : UISearchBarDelegate {
         
         func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
             if searchText.count == 0{
                 isFiltered = false
                 tableView.reloadData()
             }else{
                 isFiltered = true
                self.leaguesSearch = self.leagues.filter({$0.strLeague!.prefix(searchText.count)==searchText})
                 tableView.reloadData()
             }
         }
         
     }
