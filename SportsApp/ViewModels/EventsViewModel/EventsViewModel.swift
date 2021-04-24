//
//  EventsViewModel.swift
//  SportsApp
//
//  Created by fayza on 4/23/21.
//  Copyright © 2021 fayza. All rights reserved.
//
import Foundation

class EventsViewModel: NSObject {
    
    var eventsService : EventsService!
   
    var events : [[String : String?]]! {
        didSet{
            
            self.bindEventsViewModelToView()
        }
        
    }
    var showError : String! {
        
        didSet{
            
            self.bindViewModelErrorToView()
        }
        
    }
    
    var bindEventsViewModelToView : (()->()) = {}
    var bindViewModelErrorToView : (()->()) = {}
    
    
    override init() {
        
        super .init()
        self.eventsService = EventsService()
    }
    
    
    func fetchEventsDataFromAPI (id:String){
        
        eventsService.fetchEventsData(id: id, completion: { (event, error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                
                self.events = event
                
            }
           
        })
    }

}


