//
//  TeamsTableViewCell.swift
//  SportsApp
//
//  Created by fayza on 4/21/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class TeamsTableViewCell: UITableViewCell {
    
    var leagueId = String()

     @IBOutlet weak var collectionView: UICollectionView!
            var arrayOfLastEvents = [LastEvents]()
            override func awakeFromNib() {
                super.awakeFromNib()
                collectionView.delegate = self
                collectionView.dataSource = self
                
                
                
            }

            override func setSelected(_ selected: Bool, animated: Bool) {
                super.setSelected(selected, animated: animated)

                let urlFile="https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=\(leagueId)"
                                   Alamofire.request(urlFile).validate().responseJSON {response in
                                        if let error=response.error{
                                            print("Error")
                                        }else if let jsonDict=response.result.value as? [String :Any]{
                                            if let arr = jsonDict["events"] as? [[String :Any]]{
                                                for i in 0...arr.count-1 {
                                                    self.arrayOfLastEvents.append(LastEvents(idEvent: arr[i]["idEvent"] as? String ?? "", strEvent: arr[i]["strEvent"] as? String ?? "", strEventThumb: arr[i]["strThumb"] as? String ?? "", dateEvent: arr[i]["dateEvent"] as? String ?? ""))
                                                    self.collectionView.reloadData()
                                                }
                                            }
                                        }
                                    }
                            }

        }

        extension TeamsTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return arrayOfLastEvents.count
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Teamscell", for: indexPath)
                    let img = cell.viewWithTag(1) as! UIImageView //refer the label by Tag
                               
                    
                    img.sd_setImage(with: URL(string: arrayOfLastEvents[indexPath.row].strEventThumb!), placeholderImage: UIImage(named: "tom"))
                 
                return cell
            }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                return CGSize(width: 130, height: 130)
            }
            
            
        }
