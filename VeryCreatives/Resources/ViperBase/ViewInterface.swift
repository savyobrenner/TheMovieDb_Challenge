//
//  ViewInterface.swift
//

import UIKit
import SafariServices

protocol ViewInterface: AnyObject {
    func fullScreenLoading(hide: Bool)
}

extension ViewInterface where Self: UIViewController {
    
    func fullScreenLoading(hide: Bool) {
        fullScreenLoading(hide: hide, height: nil)
    }
    
    func fullScreenLoading(hide: Bool, height: CGFloat?) {
        
        let tag = 99
        if hide {
            for views in self.view.subviews where views.tag == tag {
                for activity in views.subviews where activity is UIActivityIndicatorView {
                    views.removeFromSuperview()
                }
            }
        } else {
            let screenSize = UIScreen.main.bounds
            let screenWidth = screenSize.width
            let screenHeight = height ?? screenSize.height
            let view = UIView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: screenWidth, height: screenHeight))
            view.backgroundColor = UIColor.black
            view.tag = tag
            
            let activityIndicator = UIActivityIndicatorView()
            
            activityIndicator.startAnimating()
            activityIndicator.color = .white
            view.addSubview(activityIndicator)
            
            activityIndicator.center =  view.center
            
            self.view.addSubview(view)
        }
    }
    
    func openExternalLinks(link: String) {
        guard let url = URL(string: link) else {
            return //be safe
        }
        
        let webView = SFSafariViewController(url: url)
        present(webView, animated: true)
    }
}
