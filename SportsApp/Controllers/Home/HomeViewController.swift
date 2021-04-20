//
//  HomeViewController.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/19/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var arrayOfAllSports=[AllSports]()

    @IBOutlet weak var homeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let x1=AllSports(strTitle: "Moahmed", img:"")
        let x2=AllSports(strTitle: "Abdallah", img: "abc")
        let x3=AllSports(strTitle: "Ahmed", img: "abc")
        let x4=AllSports(strTitle: "Moahmed", img: "abc")
        let x5=AllSports(strTitle: "Fayza", img: "abc")
        
        arrayOfAllSports.append(x1)
        arrayOfAllSports.append(x2)
        arrayOfAllSports.append(x3)
        arrayOfAllSports.append(x4)
        arrayOfAllSports.append(x5)

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
        
        cell.title.text=arrayOfAllSports[indexPath.row].strTitle

        
        return cell
    }
    
}
extension HomeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200,height: 300)
    }
}
extension HomeViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrayOfAllSports[indexPath.row].strTitle)
    }
}


