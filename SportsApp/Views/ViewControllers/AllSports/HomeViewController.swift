//
//  HomeViewController.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/19/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import SDWebImage
class HomeViewController: UIViewController {
    
    var arrayOfAllSports=[AllSports]()
    let allSportsViewModel = AllSportsViewModel()


    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.dataSource=self
        homeCollectionView.delegate=self
        homeCollectionView.collectionViewLayout=UICollectionViewFlowLayout()

        allSportsViewModel.bindAllSportsViewModelToView = {
                    
            self.onSuccessUpdateView()
            
        }
        
        allSportsViewModel.bindViewModelErrorToView = {
                    
            self.onFailUpdateView()
            
        }
        
    }
    
    func onSuccessUpdateView(){
        
        arrayOfAllSports = allSportsViewModel.allSports
        self.homeCollectionView.reloadData()
        
    }
    
    func onFailUpdateView(){
        
       
        let alert = UIAlertController(title: "Error", message: allSportsViewModel.showError, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
        }
        
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
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
        print(arrayOfAllSports[indexPath.row].idSport)
        print(arrayOfAllSports[indexPath.row].strSport)
        print(arrayOfAllSports[indexPath.row].strSportThumb)
    }
}