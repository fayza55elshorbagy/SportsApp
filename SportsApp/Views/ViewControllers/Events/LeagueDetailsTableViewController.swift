////
////  LeagueDetailsTableViewController.swift
////  SportsApp
////
////  Created by fayza on 4/23/21.
////  Copyright © 2021 fayza. All rights reserved.
////
//
//import UIKit
//
//class LeagueDetailsTableViewController: UITableViewController {
//    
//    let favoriteViewModel = FavoriteViewModel()
//      
//      var leagueId : String?{
//         didSet {
//           self.tableView.reloadData()
//             }}
//      override func viewDidLoad() {
//          super.viewDidLoad()
//       
//          navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
//        let x = favoriteViewModel.isFavorite(idTeam: leagueId!)
//        if x {
//            // is favorite pic
//        }else
//        {
//            // not favorite pic
//        }
//        // to insert
//       // favoriteViewModel.addToFavorite(favorite: <#T##AllLeagues#>)
//          //custom bar button
//          /*
//          let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//          backButton.setImage(UIImage(named: "back.png"), for: .normal)
//          backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
//          self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: backButton)*/
//      }
//      @objc func addTapped() {
//          print("tappped")
//          
//      }
//      // MARK: - Table view data source
//
//      override func numberOfSections(in tableView: UITableView) -> Int {
//          // #warning Incomplete implementation, return the number of sections
//          return 1
//      }
//
//      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//          // #warning Incomplete implementation, return the number of rows
//          return 3
//      }
//
//      
//      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//      
//          
//          if indexPath.row == 0 {
//              let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingCell") as! UpcomingTableViewCell
//                  cell.leagueId = self.leagueId!
//
//              return cell
//          } else if indexPath.row == 1 {
//              let cell = tableView.dequeueReusableCell(withIdentifier: "LastEvents") as! LastEventsTableViewCell
//                  cell.leagueId = self.leagueId!
//
//              return cell
//          } else {
//             let cell = tableView.dequeueReusableCell(withIdentifier: "Teams") as! TeamsTableViewCell
//                  cell.leagueId = self.leagueId!
//
//
//             return cell
//          }
//          
//
//      }
//      
//      
//      override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//          return 250
//      }
//     
//}
//extension LeagueDetailsTableViewController :UICollectionViewDelegate{
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        print("hhgdf")
//        let leagueView : TeamDetailsViewController  = (self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController"))! as! TeamDetailsViewController
//        
//        leagueView.id = self.leagueId!
//        
//        present(leagueView, animated: true, completion: nil)
//
//    }
//}
//
