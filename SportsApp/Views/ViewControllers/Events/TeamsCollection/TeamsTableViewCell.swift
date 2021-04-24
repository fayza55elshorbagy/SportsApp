//
//  TeamsCollectionViewCell.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {
    var leagueId = String()
    @IBOutlet weak var collectionView: UICollectionView!
      var arrayOfAllTeams = [AllTeams]()
      let allteamsViewModel = AllTeamsViewModel()
    
              override func awakeFromNib() {

                  super.awakeFromNib()
                  collectionView.delegate = self
                  collectionView.dataSource = self
            

                }
    
        override func setSelected(_ selected: Bool, animated: Bool) {
                  super.setSelected(selected, animated: animated)
        
                     allteamsViewModel.fetchAllTeamsDataFromAPI(idd: leagueId)

                      allteamsViewModel.bindAllTeamsViewModelToView = {
                            self.onSuccessUpdateView()
                        }

                        allteamsViewModel.bindViewModelErrorToView = {
                            self.onFailUpdateView()
                        }
    }

                func onSuccessUpdateView(){

                    arrayOfAllTeams = allteamsViewModel.allTeams
                    self.collectionView.reloadData()

                }

                func onFailUpdateView(){


                    let alert = UIAlertController(title: "Error", message: allteamsViewModel.showError, preferredStyle: .alert)

                    let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in

                    }


                    alert.addAction(okAction)

                }
              }

             

          

      extension TeamsTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
              
              
              func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return arrayOfAllTeams.count
              }
              
              func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Teamscell", for: indexPath)
               
                  let img = cell.viewWithTag(1) as! UIImageView //refer the label by Tag

                 //img.contentMode = .scaleToFill
                 img.sd_setImage(with: URL(string: arrayOfAllTeams[indexPath.row].strTeamLogo), placeholderImage: UIImage(named: "tom"))
                 img.layer.cornerRadius = img.frame.size.height/2
                 img.layer.masksToBounds = false
                 img.clipsToBounds = true
                 cell.layer.cornerRadius = 15

                  return cell
              }
              
              func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                  return CGSize(width: 100, height: 100)
              }
              
              
          }






