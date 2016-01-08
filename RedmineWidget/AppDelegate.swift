//
//  AppDelegate.swift
//  RedmineWidget
//
//  Created by Philippe Hässig on 08.01.16.
//  Copyright © 2016 Philippe Hässig. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var urlTextField: NSTextField!
    @IBOutlet weak var tokenTextField: NSTextField!

    @IBOutlet weak var saveButton: NSButton!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let defaults = NSUserDefaults.standardUserDefaults()

        if let url = defaults.stringForKey("RedmineURL") {
            urlTextField.stringValue = url
        }
        if let token = defaults.stringForKey("ApiToken") {
            tokenTextField.stringValue = token
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func saveSettings(sender: NSButton) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(urlTextField.stringValue, forKey: "RedmineURL")
        defaults.setValue(tokenTextField.stringValue, forKey: "ApiToken")
        NSApplication.sharedApplication().terminate(self)
    }

    @IBAction func quitApplication(sender: AnyObject) {
        NSApplication.sharedApplication().terminate(self)
    }
}

