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
    
    var url : String? {
        get {
            return defaults.stringForKey("RedmineURL")
        }
        
        set(newUrl) {
            defaults.setValue(newUrl, forKey: "RedmineURL")
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