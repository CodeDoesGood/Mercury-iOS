//
//  MainViewController.swift
//  Mercury-iOS
//
//  Created by mpc on 8/25/18.
//  Copyright © 2018 mpc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIWebViewDelegate  {

    var webView: UIWebView?
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 100.0, y: 100.0, width: 40.0, height: 40.0)
        
        activityIndicator = UIActivityIndicatorView(frame: frame)
        activityIndicator?.center = self.view.center
        activityIndicator?.isHidden = true
        
        webView = UIWebView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height))
        
        guard let webView = webView else { return }
        
        webView.delegate = self
        self.view.addSubview(webView)
        
        if let url = URL(string: Organization.website) {
            let request = URLRequest(url: url)
 
            DispatchQueue.main.async {
                webView.loadRequest(request)
                self.activityIndicator?.isHidden = false
            }
        }
    }

    func webViewDidStartLoad(_ webView: UIWebView){
        activityIndicator?.color = .red
        activityIndicator?.alpha = 1
        activityIndicator?.isHidden = false
        activityIndicator?.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        activityIndicator?.stopAnimating()
        activityIndicator?.isHidden = true
    }
}
