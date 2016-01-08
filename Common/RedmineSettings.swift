//
//  RedmineSettings.swift
//  RedmineWidget
//
//  Created by Philippe Hässig on 08.01.16.
//  Copyright © 2016 Philippe Hässig. All rights reserved.
//

import Foundation

class RedmineSettings {
    var defaults : NSUserDefaults {
        get {
            return NSUserDefaults(suiteName: "ch.neckhair.RedmineWidgetDefaults")!
        }
    }
    
    var url : NSURL? {
        get {
            return defaults.URLForKey("RedmineURL")
        }
        
        set(newUrl) {
            defaults.setURL(newUrl, forKey: "RedmineURL")
        }
    }
    
    var token : String? {
        get {
            return defaults.stringForKey("ApiToken")
        }
        
        set(newToken) {
            defaults.setValue(newToken, forKey: "ApiToken")
        }
    }
}