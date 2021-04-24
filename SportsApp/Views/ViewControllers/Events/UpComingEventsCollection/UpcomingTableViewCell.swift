//
//  UpcomingTableViewCell.swift
//  SportsApp
//
//  Created by fayza on 4/24/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class UpcomingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var leagueId = String()

    var arrayOfAllEvents = [[String : String?]]()
    let allEventsViewModel = EventsViewModel()
    
    override func awakeFromNib() {
            super.awakeFromNib()
            collectionView.delegate = self
            collectionView.dataSource = self
    
            }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
               super.setSelected(selected, animated: animated)
        print("OOOOOO\(leagueId)")
            allEventsViewModel.fetchEventsDataFromAPI(id: leagueId)

            allEventsViewModel.bindEventsViewModelToView = {
                           
                   self.onSuccessUpdateView()
                   
               }
               
            allEventsViewModel.bindViewModelErrorToView = {
                           
                   self.onFailUpdateView()
                   
               }
       }
    
    func onSuccessUpdateView(){
        
        arrayOfAllEvents = allEventsViewModel.events
        self.collectionView.reloadData()
        
    }
    
    func onFailUpdateView(){
        
       
        let alert = UIAlertController(title: "Error", message: allEventsViewModel.showError, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
        }
        
        
        alert.addAction(okAction)
    }
       
    }

    extension UpcomingTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
            
            
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return arrayOfAllEvents.count
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                var eventName = cell.viewWithTag(2) as! UILabel //refer the label by Tag
                let dateEvent = cell.viewWithTag(4) as! UILabel //refer the label by Tag
                let img = cell.viewWithTag(1) as! UIImageView //refer the label by Tag
                
                eventName.text = (arrayOfAllEvents[indexPath.row]["strEvent"]!!)
                         
                dateEvent.text = (arrayOfAllEvents[indexPath.row]["dateEvent"]!!)
                print(arrayOfAllEvents[indexPath.row]["strEvent"]!!)
                img.sd_setImage(with: URL(string: (arrayOfAllEvents[indexPath.row]["strThumb"] ?? "")!), placeholderImage: UIImage(named: "tom"))
                img.layer.cornerRadius = img.frame.size.height/2
                img.layer.masksToBounds = false
                img.clipsToBounds = true
                
                cell.layer.cornerRadius = 15
                
                    return cell
            }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                return CGSize(width: 200, height: 145)
            }
            
            
        }



