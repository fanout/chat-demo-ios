//
//  UtilityManager.swift
//  MyDocChat
//
//  Created by Danial Zahid on 29/05/15.
//  Copyright (c) 2015 DanialZahid. All rights reserved.
//

import UIKit


class UtilityManager: NSObject {
    
    static func stringFromNSDateWithFormat(date: NSDate, format : String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date as Date)
        
    }
    
    static func dateFromStringWithFormat(date: String, format: String) -> NSDate{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: date)! as NSDate
    }
    
    static func appDateFromServerDate(serverDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constant.serverDateFormat
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        return dateFormatter.date(from: serverDate)!
    
    }
    
    static func serverDateStringFromAppDateString(dateString: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constant.appDateFormat
        dateFormatter.timeZone = NSTimeZone.local
        
        
        let newDateFormatter = DateFormatter()
        newDateFormatter.dateFormat = Constant.serverDateFormat
        newDateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        return newDateFormatter.string(from: dateFormatter.date(from: dateString)!)
        
    }
    
    //MARK: - Other Methods
    
    static func activityIndicatorForView(view: UIView) -> UIActivityIndicatorView{
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        activityIndicator.color = UIColor.darkGray
        activityIndicator.center = view.center
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
    
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
