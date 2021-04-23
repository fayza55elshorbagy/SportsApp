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
         var leagues = [League]()
         var leaguesSearch = [League]()
         var isFiltered = false
         var strSport : String = ""
         
         override func viewDidLoad() {
             super.viewDidLoad()
             searchBar.delegate = self
             viewModel.bindLeaguesToView = {
                 self.didReciveLeague()
             }
            print(strSport)
             viewModel.getAllLeagues(sportName: strSport)
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

         
         override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesCell", for: indexPath) as! AllLeaguesTableViewCell
             
             var league : League!
             if isFiltered {
                 league = leaguesSearch[indexPath.row]
             }else{
                 league = leagues[indexPath.row]
             }
             
            cell.leagueTitle.text = league.strLeague

//            if let imgStr : String = league.strBadge{
//                cell.leagueImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
//                cell.leagueImage.sd_setImage(with: URL(string: imgStr), placeholderImage: UIImage(named: "tom"))
//                cell.leagueImage.layer.cornerRadius = cell.leagueImage.frame.size.height/2
//                 cell.leagueImage.layer.masksToBounds = false
//                 cell.leagueImage.clipsToBounds = true
//             }
             return cell
         }
         
         override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80.0
         }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let leagueDetailView : LeagueDetailsTableViewController  = (self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsTableViewController"))! as! LeagueDetailsTableViewController
               
               leagueDetailView.leagueId = leagues[indexPath.row].idLeague
               present(leagueDetailView, animated: true, completion: nil)
    }

     }
//  open youtube
//    let Webview : WebViewController  = (self.storyboard?.instantiateViewController(withIdentifier: "WebViewController"))! as! WebViewController
//
//leagueDetailView
//      present(leagueDetailView, animated: true, completion: nil)


     extension LeagueTableViewController : UISearchBarDelegate {
         
         func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
             if searchText.count == 0{
                 isFiltered = false
                 tableView.reloadData()
             }else{
                 isFiltered = true
                self.leaguesSearch = self.leagues.filter({$0.strLeague.prefix(searchText.count)==searchText})
                 tableView.reloadData()
             }
         }
         
     }
