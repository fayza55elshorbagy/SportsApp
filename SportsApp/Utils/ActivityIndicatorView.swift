//
//  ActivityIndicatorView.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicatorView {
    
    static func startAnimating(indicator:UIActivityIndicatorView) {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
               indicator.startAnimating()
            }
        }
    static func stopAnimating(indicator:UIActivityIndicatorView) {
        DispatchQueue.main.async {
           indicator.stopAnimating()
            indicator.hidesWhenStopped=true

        }
    }
}

