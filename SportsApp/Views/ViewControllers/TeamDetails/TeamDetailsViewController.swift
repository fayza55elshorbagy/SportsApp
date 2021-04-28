//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit

class TeamDetailsViewController: UITableViewController {
    
    
    var id:String="133604"
    var urlLink:String!
    var res:OneTeam!
    let teamDetailsViewModel = TeamDetailsViewModel()

      @IBOutlet weak var backImg: UIImageView!
      @IBOutlet weak var logoImg: UIImageView!
      @IBOutlet weak var teamName: UILabel!
      @IBOutlet weak var leagueName: UILabel!
      @IBOutlet weak var stadName: UILabel!
      @IBOutlet weak var countryName: UILabel!
      @IBOutlet weak var descr: UITextView!
      
        @IBOutlet weak var instagram: UIButton!
        @IBOutlet weak var twitter: UIButton!
        @IBOutlet weak var facebook: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // var id:String="133604"
        print("\(id)1")

        teamDetailsViewModel.seturl(idTeam:id)

        teamDetailsViewModel.bindTeamDetailsViewModelToView = {
                    
            self.onSuccessUpdateView()
        }
        teamDetailsViewModel.bindViewModelErrorToView = {
                    
            self.onFailUpdateView()
        }

    }
    
    @IBAction func twitterAction(_ sender: Any) {
        urlLink=res.strFacebook
        self.performSegue(withIdentifier: "teamDetails", sender: self)
    }
    @IBAction func instagramAction(_ sender: Any) {
        urlLink=res.strTwitter
        self.performSegue(withIdentifier: "teamDetails", sender: self)

    }
    @IBAction func facebookAction(_ sender: Any) {
        urlLink=res.strInstagram
        self.performSegue(withIdentifier: "teamDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webView = segue.destination as! WebViewController
            
            if segue.identifier == "teamDetails"{
                webView.link = "https://" + urlLink
            }
        }
    func onSuccessUpdateView(){
        
        res = teamDetailsViewModel.team
        print(res)
        
        self.teamName.text=res?.strTeam
        self.leagueName.text=res?.strLeague
        self.descr.text=res?.strDescriptionEN
        self.stadName.text=res?.strStadium
        self.countryName.text=res?.strCountry
        
        self.backImg.sd_setImage(with: URL(string: res!.strStadiumThumb), placeholderImage: UIImage(named: "placeholder.png"))
        self.logoImg.sd_setImage(with: URL(string: res!.strTeamLogo), placeholderImage: UIImage(named: "placeholder.png"))

        

 }
    
    func openSocial(url:String)  {
        print(url)
        
    }
    func onFailUpdateView(){
        
       
        let alert = UIAlertController(title: "Error", message: teamDetailsViewModel.showError, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
        }
        
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
     }

    
      
   /*
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

       // Configure the cell...

       return cell
   }
   */

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

