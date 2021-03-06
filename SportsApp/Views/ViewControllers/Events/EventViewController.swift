//
//  EventViewController.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import SDWebImage
class EventViewController: UIViewController {

    var arrayOfAllTeams = [AllTeams]()
    let allteamsViewModel = AllTeamsViewModel()
    var id : String = "4328"

    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        

        allteamsViewModel.setID(id : id)
        teamsCollectionView.dataSource=self
        teamsCollectionView.delegate=self
        
        allteamsViewModel.bindAllTeamsViewModelToView = {
                    
            self.onSuccessUpdateView()
            
        }
        
        allteamsViewModel.bindViewModelErrorToView = {
                    
            self.onFailUpdateView()
            
        }
        
       // FavoriteViewModel().addToFavorite(favorite: AllLeagues(idLeague: "1252", strLeague: "Real Madrid", strLeagueThumb: "M", strYoutube: "www.youtube.com"))
        //FavoriteViewModel().addToFavorite(favorite: AllLeagues(idLeague: "12525252", strLeague: "barcelona", strLeagueThumb: "M", strYoutube: "www.youtube.com"))

    }
    
    func onSuccessUpdateView(){
        
        arrayOfAllTeams = allteamsViewModel.allTeams
        self.teamsCollectionView.reloadData()
        
    }
    
    func onFailUpdateView(){
        
       
        let alert = UIAlertController(title: "Error", message: allteamsViewModel.showError, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
        }
        
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
extension EventViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfAllTeams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
        
        cell.img.contentMode = .scaleToFill
        cell.img.sd_setImage(with: URL(string: arrayOfAllTeams[indexPath.row].strTeamLogo), placeholderImage: UIImage(named: "M"))

        return cell
    }
    
}
extension EventViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrayOfAllTeams[indexPath.row].idTeam)
    }
}
