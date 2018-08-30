//
//  MainViewController.swift
//  Mercury-iOS
//
//  Created by mpc on 8/25/18.
//  Copyright © 2018 mpc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController  {

    /* UIView that defines and displays the website in a UIWebView */
    var webView: WebView?

    override func viewWillAppear(_ animated: Bool) {
        let frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height)
        
        webView = WebView(frame: frame)
        guard let webView = webView else { return }
        
        self.view.addSubview(webView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
