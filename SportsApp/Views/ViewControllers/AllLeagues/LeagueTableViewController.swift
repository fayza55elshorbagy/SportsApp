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
import SkeletonView
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("first")

        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .lightGray), animation: nil, transition: .crossDissolve(0.25))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("second")

        self.searchBar.delegate = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            if(self.leagues.count > 0){
                self.tableView.stopSkeletonAnimation()
                self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            }
            else{
                
            }
                  })
        self.viewModel.bindLeaguesToView = {
                    self.didReciveLeague()
                          }
        self.viewModel.getAllLeagues(sportName: self.Strsport)
       
    }
    func didReciveLeague(){
        leagues = viewModel.leaguesDetailCompleted
        print("from view controller")
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if isFiltered {
            return leaguesSearch.count
        }
        return leagues.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1

    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueDetailScreen : LeagueDetailsViewController  = (self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController"))! as! LeagueDetailsViewController
        
        leagueIdPressed = leagues[indexPath.section].idLeague!
        leagueStrPressed = leagues[indexPath.section].strLeague!
        league = leagues[indexPath.section]
        
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
               league = leaguesSearch[indexPath.section]
           }else{
               league = leagues[indexPath.section]
           }
           
          cell.leagueTitle.text = league.strLeague
          self.urlLink = leagues[indexPath.section].strYoutube!
           if let imgStr = league.strBadge{
               cell.leagueImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
               cell.leagueImage.sd_setImage(with: URL(string: imgStr), placeholderImage: UIImage(named: "holder"))
           }
        cell.leagueImage.layer.cornerRadius = cell.leagueImage.frame.size.height/2
        cell.leagueImage.layer.masksToBounds = false
        cell.leagueImage.clipsToBounds = true
      
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowOpacity = 0.6
       
           return cell
    }
    // Set the spacing between sections
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
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
        return 80.0
    }
    
    

}


     extension LeagueTableViewController : UISearchBarDelegate, SkeletonTableViewDataSource {
         
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
        
        func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
            return "leaguesCell"
        }
        
        func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        
         
     }
