//
//  LeagueDetailsTableViewController.swift
//  SportsApp
//
//  Created by fayza on 4/21/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit

class LeagueDetailsTableViewController: UITableViewController {
  
    
    var leagueId : String?{
    didSet {
      self.tableView.reloadData()
        }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LeagueDetails"+leagueId!)
     
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        //custom bar button
        /*
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        backButton.setImage(UIImage(named: "back.png"), for: .normal)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: backButton)*/
    }
    @objc func addTapped() {
        print("tappped")
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingCell") as! UpcomingEventsCustomCellTableViewCell
            cell.leagueId = self.leagueId!
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LastEvents") as! LastEventsTableViewCell
            cell.leagueId = self.leagueId!

            // Set up cell.button
            return cell
        } else {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Teams") as! TeamsTableViewCell
            cell.leagueId = self.leagueId!

           return cell
        }
        

    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
