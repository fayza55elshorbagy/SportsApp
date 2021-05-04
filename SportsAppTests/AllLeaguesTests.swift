//
//  AllLeaguesTests.swift
//  SportsAppTests
//
//  Created by fayza on 5/2/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import XCTest
@testable import SportsApp

class AllLeaguesTests: XCTestCase {

    
    var allLeagues : MockAllLeaguesService!
    
    override func setUpWithError() throws {
        allLeagues = MockAllLeaguesService(shouldReturnError: false)
    }

    override func tearDownWithError() throws {
       allLeagues = nil
    }
    
    func testAllLeagues(){
        allLeagues.getAllLeagues(sportName: "Soccer") { (leagues, error) in
            if let error = error{
                XCTFail()
            }else{
                XCTAssertEqual(leagues?.count, 2)
            }
        }
        
    }
    
    func testLeagueDetails(){
        allLeagues.getLeaugesDetail(leagueId: "") { (leagueDetails, error) in
            if let error = error{
                XCTFail()
            }else{
                XCTAssertEqual(leagueDetails?.strSport, "Soccer")
            }
        }
            
        }
        
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
