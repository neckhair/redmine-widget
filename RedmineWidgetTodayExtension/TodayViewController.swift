//
//  TodayViewController.swift
//  RedmineWidgetTodayExtension
//
//  Created by Philippe Hässig on 08.01.16.
//  Copyright © 2016 Philippe Hässig. All rights reserved.
//

import Cocoa
import NotificationCenter

class TodayViewController: NSViewController, NCWidgetProviding {

    @IBOutlet weak var urlLabel: NSTextField!
    
    override var nibName: String? {
        return "TodayViewController"
    }

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        let settings = RedmineSettings()
        
        if let url = settings.url {
            urlLabel.stringValue = url.absoluteString
        } else {
            urlLabel.stringValue = "No URL configured!"
        }

        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
        completionHandler(.NoData)
    }

}
