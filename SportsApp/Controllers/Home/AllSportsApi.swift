//
//  AllSportsApi.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/20/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
class AllSportsApi {
    func getAllSports() -> [AllSports] {
        return[AllSports(strTitle: "Api test", img: "img"),AllSports(strTitle: "Api test2", img: "img")]
    }
}
