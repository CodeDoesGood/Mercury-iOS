//
//  WebView.swift
//  Mercury-iOS
//
//  Created by mpc on 8/28/18.
//  Copyright © 2018 mpc. All rights reserved.
//

import UIKit

class WebView: UIView, UIWebViewDelegate {

    //MARK: - Views
    var view: UIView?
    var webView: UIWebView?
    var activityIndicator = UIActivityIndicatorView()
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)

        /* Setup main view for window */
        view = UIView(frame: frame)
        guard let view = view else { return }
        addSubview(view)
        
        /* Setup webView to display organization website */
        webView = UIWebView(frame: frame)
        guard let webView = webView else { return }
        webView.delegate = self
        view.addSubview(webView)
        
        /* Setup activity indicator to display while page is loading */
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        
        /* Load organization website in webview */
        if let url = URL(string: Organization.website) {
            let request = URLRequest(url: url)
            
            DispatchQueue.main.async {
                webView.loadRequest(request)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Activity indicator delegates
    func webViewDidStartLoad(_ webView: UIWebView){
        activityIndicator.color = .orange
        activityIndicator.alpha = 1.0
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        activityIndicator.stopAnimating()
    }
}
