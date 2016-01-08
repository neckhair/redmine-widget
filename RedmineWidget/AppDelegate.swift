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
    
    var settings : RedmineSettings {
        get {
           return RedmineSettings()
        }
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        if let url = settings.url {
            urlTextField.stringValue = url
        }
        if let token = settings.token {
            tokenTextField.stringValue = token
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func saveSettings(sender: NSButton) {
        settings.url = urlTextField.stringValue
        settings.token = tokenTextField.stringValue
        quitApplication(sender)
    }

    @IBAction func quitApplication(sender: AnyObject) {
        NSApplication.sharedApplication().terminate(self)
    }
}

