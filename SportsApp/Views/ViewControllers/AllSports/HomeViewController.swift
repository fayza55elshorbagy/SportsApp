//
//  HomeViewController.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/19/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import SDWebImage
import Foundation


let reachability = try! Reachability()

class HomeViewController: UIViewController {
    
    var arrayOfAllSports=[AllSports]()
    let allSportsViewModel = AllSportsViewModel()
    @IBOutlet weak var connImg: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connImg.image = UIImage(named: "conn")

        connImg.isHidden = true
        homeCollectionView.dataSource=self
        homeCollectionView.delegate=self
        homeCollectionView.collectionViewLayout=UICollectionViewFlowLayout()
        homeCollectionView.layer.cornerRadius = 15
       // uiView.addSubview(createViewHeader()!)
        
        ActivityIndicatorView.startAnimating(indicator: indicator)
        if reachability.connection == .unavailable{
            
            ActivityIndicatorView.stopAnimating(indicator: indicator)
//            showAlert(title:"Error",message:"No Internet Connection")
            connImg.isHidden = false
                    
        }else{
            allSportsViewModel.bindAllSportsViewModelToView = {
                self.onSuccessUpdateView()
            }
            allSportsViewModel.bindViewModelErrorToView = {
                self.onFailUpdateView()
            }
                    
        }
        do{
            try reachability.startNotifier()
           }catch{
                print("error")
            ActivityIndicatorView.stopAnimating(indicator: indicator)
        }
    }

   
    func onSuccessUpdateView(){
        
        arrayOfAllSports = allSportsViewModel.allSports
        self.homeCollectionView.reloadData()
        ActivityIndicatorView.stopAnimating(indicator: self.indicator)

        
    }
    
    
    func showAlert(title:String,message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in}
            
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    func onFailUpdateView(){
        showAlert(title: "Error", message: "Error Featching Data")
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
                cell.img.clipsToBounds = true
                cell.img.sd_setImage(with: URL(string: arrayOfAllSports[indexPath.row].strSportThumb), placeholderImage: UIImage(named: "M"))
                cell.img.layer.cornerRadius = 15

        
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
        
        leagueView.Strsport = arrayOfAllSports[indexPath.row].strSport
        print(arrayOfAllSports[indexPath.row].idSport)
        print(arrayOfAllSports[indexPath.row].strSport)
        print(arrayOfAllSports[indexPath.row].strSportThumb)
        self.navigationController?.pushViewController(leagueView, animated: true)

    }
}
