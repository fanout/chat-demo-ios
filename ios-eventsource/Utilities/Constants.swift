//
//  Constants.swift
//  Quicklic
//
//  Created by Danial Zahid on 30/07/2015.
//  Copyright (c) 2015 Danial Zahid. All rights reserved.
//

import UIKit

public class UserDefaultKey: NSObject {
    static let sessionID = "session_id"
}

public class Constant: NSObject {

    static let applicationName = "Fanout"
    static let serverDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static let appDateFormat = "MM/dd/yyyy hh:mm:ss a"
    static let eventDateFormat = "MM/dd/yyyy hh:mm a"
    static let eventDetailDateFormat = "MMM dd yyyy',' hh:mma"
    static let animationDuration : TimeInterval = 0.5
    
    static let serverURL = "http://chat.fanoutapp.com/"
    static let roomID = "room-default"
    
    static let eventsourceURL = "events/?channel=room-default"
    static func messageURL(roomID: String) -> String {
        return "rooms/\(roomID)/messages/"
    }
    
    
}
