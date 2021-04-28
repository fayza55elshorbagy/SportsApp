//
//  LeagueDetailsViewController.swift
//  SportsApp
//
//  Created by fayza on 4/27/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import SDWebImage

class LeagueDetailsViewController: UIViewController {
    
    @IBOutlet weak var upcomingEventCollection: UICollectionView!
    @IBOutlet weak var passedEventCollection: UICollectionView!
    @IBOutlet weak var teamsCollection: UICollectionView!
    @IBOutlet weak var likeToggle: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //let eventService = EventsService()
    let favViewModel = FavoriteViewModel()
    let viewModel = EventsViewModel()
    var teamDetail = Teams()
    var league = LeaugeDetail()
    var leagueStr = "English Premier League"
    var leagueId = "4328"
    var teams = [Teams]()
    var passedEvents = [Event]()
    var comingEvents = [Event]()
    var comingEventError = ""
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(leagueId)from 2" )
        if(favViewModel.isFavorite(idTeam: leagueId)){
            likeToggle.setImage(UIImage(named:"redHeart"), for: .normal)

        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        bindCollectionViews()
        bindToViewModel()

    }
    
    func bindCollectionViews(){
        //connecting collection to controller
        upcomingEventCollection.delegate = self
        upcomingEventCollection.dataSource = self
        passedEventCollection.delegate = self
        passedEventCollection.dataSource = self
        teamsCollection.delegate = self
        teamsCollection.dataSource = self
        print("cccc")
    }
    
    func bindToViewModel(){
        //bind with view model
        print("vvvv")
        self.viewModel.getUpcomingEvents(self.leagueId)
        self.viewModel.getPassedEvents(leagueId: self.leagueId)
        self.viewModel.getTeamsInLeague(leagueStr: self.leagueStr)

        viewModel.bindComingEventsWithView = {
            self.didReceiveComingEvents()
            print("ppppppp")
        }
        viewModel.bindTeamsWithView = {
            self.didReceiveTeams()
        }
        viewModel.bindPassedEventsWithView = {
            self.didReceivePastEvents()
        }
        viewModel.bindComingEventsErrorWithView = {
            self.didReceiveComingEventError()
        }
        
       
    }
    
    func didReceiveTeams(){
        teams = viewModel.teams
        print(teams)
        teamsCollection.reloadData()
    }

    func didReceiveComingEvents(){
        comingEvents = viewModel.comingEvents
        upcomingEventCollection.reloadData()
        print("comingEvents")
    }

    func didReceivePastEvents(){
        passedEvents = viewModel.pastEvents
        passedEventCollection.reloadData()
    }
    
    func didReceiveComingEventError(){
        comingEventError = viewModel.comingEventError
        
        let alert = UIAlertController(title: "Alert", message: "No upcoming Matches\nThe new Season hasn't started yet", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("alert working")
        }
        alert.addAction(okAction)
        
    }
    
    @IBAction func likeToggle(_ sender: UIButton) {

        let favScreen : FavoriteTableViewController  = (self.storyboard?.instantiateViewController(withIdentifier: "FavoriteTableViewController"))! as! FavoriteTableViewController
        print("iiiiii")
        if(favViewModel.isFavorite(idTeam: leagueId)){
            likeToggle.setImage(UIImage(named:"309056-64"), for: .normal)
            favViewModel.deleteFromFavorite(idTeam: leagueId)
            print("already fav")
        }
        else{
            likeToggle.setImage(UIImage(named:"redHeart"), for: .normal)
            favScreen.addToFavorite(favorite: self.league)
            present(favScreen, animated: true, completion: nil)

        }
        
    }
}



// MARK: - Collection Views
extension LeagueDetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.upcomingEventCollection:
            return comingEvents.count
        case self.passedEventCollection:
            return passedEvents.count
        case self.teamsCollection:
            return teams.count
        default:
            return 1
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.upcomingEventCollection{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingEventCell", for: indexPath) as! upComingEventsCustomCell
            print(comingEvents)
            let event = comingEvents[indexPath.row]
            cell.homeName.text = event.strHomeTeam
            cell.awayName.text = event.strAwayTeam
            cell.eventDate.text = event.dateEvent
            cell.eventTime.text = event.strTime
            cell.eventTime.text?.removeLast(3)
            var imgHome = ""
            var imgAway = ""
            for team in teams {
                if event.strHomeTeam == team.strTeam{
                    imgHome = team.strTeamBadge!
                }
                if event.strAwayTeam == team.strTeam{
                    imgAway = team.strTeamBadge!
                }
            }

            cell.homeImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.homeImg.sd_setImage(with: URL(string: imgHome), placeholderImage: UIImage(named: "holder"))
            print("iiiiiimg away\(imgAway)")
            cell.awayImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.awayImg.sd_setImage(with: URL(string: imgAway), placeholderImage: UIImage(named: "holder"))
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowOpacity = 0.6
            
            return cell
            
        }else if collectionView == self.passedEventCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FinishedEventCell", for: indexPath) as! passedEventCustomCell
            let event = passedEvents[indexPath.row]
            cell.homeTeam.text = event.strHomeTeam
            cell.awayTeam.text = event.strAwayTeam
            cell.homeScore.text = event.intHomeScore
            cell.awayScore.text = event.intAwayScore
            cell.date.text = event.dateEvent
            var imgHome = ""
            var imgAway = ""
            for team in teams {
                if event.strHomeTeam == team.strTeam{
                    imgHome = team.strTeamBadge!
                }
                if event.strAwayTeam == team.strTeam{
                    imgAway = team.strTeamBadge!
                }
            }
            
            cell.homeImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.homeImg.sd_setImage(with: URL(string: imgHome), placeholderImage: UIImage(named: "holder"))
            
            cell.awayImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.awayImg.sd_setImage(with: URL(string: imgAway), placeholderImage: UIImage(named: "holder"))
            cell.layer.cornerRadius = 25
            cell.layer.borderWidth = 1
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowOpacity = 0.6
            return cell
            
        }else{
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! teamsCutsomCell
            
            
    
            print("**********\(teams)")
            let img = teams[indexPath.row].strTeamBadge!
            cell.teamImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.teamImage.sd_setImage(with: URL(string: img), placeholderImage: UIImage(named: "holder"))
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowOpacity = 0.6
            
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        
        if collectionView == self.upcomingEventCollection{
            print("upcoming")
        }else if collectionView == self.passedEventCollection{
            print("passed")
        }else{
              let detailScreen : TeamDetailsViewController  = (self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController"))! as! TeamDetailsViewController
            //teamDetail = teams[indexPath.row]
            detailScreen.id = teams[indexPath.row].idTeam!
            print("\(teams[indexPath.row].idTeam!) 1")
            
            present(detailScreen, animated: true, completion: nil)
        }
    }
    
    
    
}

