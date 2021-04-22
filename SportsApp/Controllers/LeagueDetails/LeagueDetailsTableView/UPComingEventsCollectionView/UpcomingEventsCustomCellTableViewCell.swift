//
//  UpcomingEventsCustomCellTableViewCell.swift
//  SportsApp
//
//  Created by fayza on 4/21/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class UpcomingEventsCustomCellTableViewCell: UITableViewCell {
        var leagueId = String()
        @IBOutlet weak var collectionView: UICollectionView!
        var arrayOfUpcomingEvents = [LastEvents]()
        override func awakeFromNib() {
            super.awakeFromNib()
            collectionView.delegate = self
            collectionView.dataSource = self
           
            
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            print("custom"+leagueId)
            let urlFile="https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=\(leagueId)"
                       Alamofire.request(urlFile).validate().responseJSON {response in
                            if let error=response.error{
                                print("Error")
                            }else if let jsonDict=response.result.value as? [String :Any]{
                                if let arr = jsonDict["events"] as? [[String :Any]]{
                                    for i in 0...arr.count-1 {
                                        self.arrayOfUpcomingEvents.append(LastEvents(idEvent: arr[i]["idEvent"] as? String ?? "", strEvent: arr[i]["strEvent"] as? String ?? "", strEventThumb: arr[i]["strThumb"] as? String ?? "", dateEvent: arr[i]["dateEvent"] as? String ?? ""))
                                       print(arr[i]["strEvent"])
                                        self.collectionView.reloadData()
                                    }
                                }
                            }
                        }        }

    }

    extension UpcomingEventsCustomCellTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return arrayOfUpcomingEvents.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            var eventName = cell.viewWithTag(2) as! UILabel //refer the label by Tag
            let dateEvent = cell.viewWithTag(4) as! UILabel //refer the label by Tag
            let img = cell.viewWithTag(1) as! UIImageView //refer the label by Tag
            
            eventName.text = arrayOfUpcomingEvents[indexPath.row].strEvent
           
            dateEvent.text = arrayOfUpcomingEvents[indexPath.row].dateEvent
            img.sd_setImage(with: URL(string: arrayOfUpcomingEvents[indexPath.row].strEventThumb!), placeholderImage: UIImage(named: "tom"))
//               switch indexPath.row {
//               case 0:
//
//               default:
//                   label.text = "Default"
//               }
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 250, height: 145)
        }
        
        
    }
