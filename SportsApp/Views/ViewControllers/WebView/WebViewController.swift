//
//  WebViewController.swift
//  SportsApp
//
//  Created by Mohamed Abdallah on 4/22/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var link : String?="https://www.youtube.com"
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlString = link else {
            return
        }
        guard let url = URL(string: urlString) else {
            return
        }
        webView.load(URLRequest(url: url))
       
    }
    

    

}
