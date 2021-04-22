//
//  HomeViewController.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/19/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
class HomeViewController: UIViewController {
    
    var arrayOfAllSports=[AllSports]()

    @IBOutlet weak var homeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlFile="https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
           Alamofire.request(urlFile).validate().responseJSON {response in
                if let error=response.error{
                    print("Error")
                }else if let jsonDict=response.result.value as? [String :Any]{
                    if let arr = jsonDict["sports"] as? [[String :Any]]{
                        for i in 0...arr.count-1 {
                            self.arrayOfAllSports.append(AllSports(idSport: arr[i]["idSport"] as! String,
                                                              strSport: arr[i]["strSport"] as! String,
                                                              strSportThumb: arr[i]["strSportThumb"] as! String))
                            self.homeCollectionView.reloadData()

                        }
                    }
                    self.homeCollectionView.reloadData()

                }
            }
 


            //arrayOfAllSports=AllSportsApi().getAllSports()

            homeCollectionView.dataSource=self
            homeCollectionView.delegate=self
            homeCollectionView.collectionViewLayout=UICollectionViewFlowLayout()

        // Do any additional setup after loading the view.
    }
    
}
extension HomeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfAllSports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        cell.title.text=arrayOfAllSports[indexPath.row].strSport
                cell.img.contentMode = .scaleToFill
                cell.img.sd_setImage(with: URL(string: arrayOfAllSports[indexPath.row].strSportThumb), placeholderImage: UIImage(named: "M"))

        
        return cell
    }
    
}
extension HomeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2.06), height: collectionView.frame.width/2.0)
    }
}
extension HomeViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leagueView : LeagueTableViewController  = (self.storyboard?.instantiateViewController(withIdentifier: "LeagueTableViewController"))! as! LeagueTableViewController
        
        leagueView.strSport = arrayOfAllSports[indexPath.row].strSport 
        print(arrayOfAllSports[indexPath.row].idSport)
        print(arrayOfAllSports[indexPath.row].strSport)
        print(arrayOfAllSports[indexPath.row].strSportThumb)
        self.navigationController?.pushViewController(leagueView, animated: true)
    }
}
