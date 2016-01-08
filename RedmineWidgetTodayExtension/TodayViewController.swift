//
//  TodayViewController.swift
//  RedmineWidgetTodayExtension
//
//  Created by Philippe Hässig on 08.01.16.
//  Copyright © 2016 Philippe Hässig. All rights reserved.
//

import Cocoa
import NotificationCenter

import Alamofire

class TodayViewController: NSViewController, NCWidgetProviding {

    @IBOutlet weak var urlLabel: NSTextField!
    
    var settings : RedmineSettings {
        get {
            return RedmineSettings()
        }
    }
    
    override var nibName: String? {
        return "TodayViewController"
    }

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        
        if let url = settings.url {
            urlLabel.stringValue = url.absoluteString
        } else {
            urlLabel.stringValue = "No URL configured!"
        }

        fetchData()
        
        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
        completionHandler(.NoData)
    }
    
    private func fetchData() {
        Alamofire.request(.GET, settings.url!, parameters: ["key": settings.token!])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response?.statusCode) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                print("Printing some JSON now:")
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }

}
