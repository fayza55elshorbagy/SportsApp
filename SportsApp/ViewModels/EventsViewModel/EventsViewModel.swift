//
//  EventsViewModel.swift
//  SportsApp
//
//  Created by fayza on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//
import Foundation

class EventsViewModel {
    let eventService = EventsService()
    var round = "1"
    var season = "2020-2021"
    var comingEvents : [Event]!{
        didSet{
            bindComingEventsWithView()
        }
    }
    
    var pastEvents : [Event]!{
        didSet{
            bindPassedEventsWithView()
        }
    }
    var teams : [Teams]!{
        didSet{
            bindTeamsWithView()
        }
    }
    
    var comingEventError : String!{
        didSet{
            bindComingEventsErrorWithView()
        }
    }
    
    var bindTeamsWithView:(()->()) = {}
    var bindComingEventsWithView:(()->()) = {}
    var bindPassedEventsWithView:(()->()) = {}
    var bindTeamsErrorWithView:(()->()) = {}
    var bindComingEventsErrorWithView:(()->()) = {}
    var bindPassedEventsErrorWithView:(()->()) = {}
    
    
    func getPassedEvents(leagueId:String){
        eventService.getPassedEvents(leagueId: leagueId) { (pastEvents, error) in
            if let events:[Event] = pastEvents{
                print("old round \(events[0].intRound!)")
                self.round = String("\(Int(events[0].intRound!)!+1)")
                print("new round \(self.round)")

                self.pastEvents = events
                print(events)
            }else{
                print(error?.localizedDescription as Any)
                
            }
        }
    }
    
    func getTeamsInLeague(leagueStr:String){
        eventService.getTeamsInLeague(leagueStr: leagueStr) { (teams, error) in
            if let teams:[Teams] = teams{
                self.teams = teams
            }else{
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    func getUpcomingEvents(_ leagueId: String){
        eventService.getUpcomingEvents(leagueId, round, season) { (events, error) in
            if let events = events{
                self.comingEvents = events
                print(events)
                print("c delivered")
            }else{
                self.comingEventError = error?.localizedDescription
                print("error for coming events")
            }
        }
    }
    

}
