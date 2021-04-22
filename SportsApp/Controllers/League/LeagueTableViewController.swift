//
//  LeagueTableViewController.swift
//  SportsApp
//
//  Created by fayza on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
class LeagueTableViewController: UITableViewController,UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filteredData = [String]()
    var strSport : String!
    var isFiltered : Bool!
    var arrayOfAllLeagues=[AllLeagues]()
    var leaguesTitle = [String]()
    var arrayOfAllLeaguesId = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(strSport!)
        tableView.dataSource = self
        searchBar.delegate = self
        isFiltered = false
        let urlOfAllLeagues = "https://www.thesportsdb.com/api/v1/json/1/all_leagues.php"
                  Alamofire.request(urlOfAllLeagues).validate().responseJSON {response in
                       if let error=response.error{
                           print("Error")
                       }else if let jsonDict=response.result.value as? [String :Any]{
                           if let arr = jsonDict["leagues"] as? [[String :Any]]{
                               for i in 0...arr.count-1 {
                                var temp = arr[i]["strSport"]! as! String
                                if(self.strSport! == temp){
                                    self.arrayOfAllLeaguesId.append(arr[i]["idLeague"]! as! String)
                                }
                               }
                            print(self.arrayOfAllLeaguesId)
                            for i in 0...self.arrayOfAllLeaguesId.count-1 {
                                let urlOfOneLeague =  "https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id=\(self.arrayOfAllLeaguesId[i])"
                                            Alamofire.request(urlOfOneLeague).validate().responseJSON {response in
                                                if let error=response.error{
                                                    print("Error")
                                                }else if let jsonDict=response.result.value as? [String :Any]{
                                                    if let arr = jsonDict["leagues"] as? [[String :Any]]{
                                                        for i in 0...arr.count-1 {
                                                            print(arr[i]["strBadge"] as? String)
                                                            self.arrayOfAllLeagues.append(AllLeagues(idLeague: arr[i]["idLeague"] as? String ?? "", strLeague: arr[i]["strLeague"] as? String ?? "", strLeagueThumb: (arr[i]["strBadge"] as? String ?? ""),  strYoutube: arr[i]["strYoutube"] as? String ?? ""))
                                                                            self.leaguesTitle.append(arr[i]["strLeague"] as! String)
                                                                            self.filteredData.append(arr[i]["strLeague"] as! String)

                                                                             self.tableView.reloadData()
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                          

                           }
                       }
                   }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(isFiltered)
        {
            return filteredData.count
        }
        return leaguesTitle.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueDetailView : LeagueDetailsTableViewController  = (self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsTableViewController"))! as! LeagueDetailsTableViewController
        leagueDetailView.leagueId =  arrayOfAllLeaguesId[indexPath.row]
          self.navigationController?.pushViewController(leagueDetailView, animated: true)
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
             print(arrayOfAllLeaguesId)
             print("kvvgggg")
              
        if(isFiltered)
        {
            cell.leagueTitle.text = filteredData[indexPath.row]
        }else{
            cell.leagueTitle.text = leaguesTitle[indexPath.row]
            cell.leagueImage.sd_setImage(with: URL(string: arrayOfAllLeagues[indexPath.row].strLeagueThumb!), placeholderImage: UIImage(named: "M"))

        }
        
        cell.yourobj =
            {
                //Do whatever you want to do when the button is tapped here
                print("Pressed")
          }
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 60
       }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0
        {
            isFiltered = false;
        }
        else{
            isFiltered = true;
            filteredData = searchText.isEmpty ? leaguesTitle : leaguesTitle.filter({(dataString : String) -> Bool in
                return dataString.range(of: searchText,options: .caseInsensitive) != nil
            })
            tableView.reloadData()

    }

    }}


