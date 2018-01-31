//
//  ChatViewController.swift
//  ios-eventsource
//
//  Created by Danial Zahid on 1/29/18.
//  Copyright © 2018 DanialZahid. All rights reserved.
//

import UIKit

class ChatViewController: QMChatViewController {
    
    static let storyboardID = "chatViewController"
    
    var eventSource: EventSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        senderID = 9999
        senderDisplayName = "danial"

        view.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        eventSource = EventSource(url: "http://chat.fanoutapp.com/events/?channel=room-default")
        
        eventSource.onOpen {
            // When opened
        }
        
        eventSource.onError { (error) in
            // When errors
        }
        
        eventSource.addEventListener("message") { (id, event, data) in
            // Here you get an event 'event-name'
            if let messageData = data {
                if let dict = self.convertToDictionary(text: messageData) {
                    let message = QBChatMessage()
                    message.text = dict["text"] as? String
                    message.senderID = dict["id"] as! UInt
                    message.senderResource = dict["from"] as? String
                    message.dateSent = UtilityManager.appDateFromServerDate(serverDate: dict["date"]! as! String)
                    self.chatDataSource.add(message)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: UInt, senderDisplayName: String!, date: Date!) {
        let message = QBChatMessage()
        message.text = text
        message.senderID = senderId
        message.dateSent = NSDate() as Date
        
        
        self.chatDataSource.add(message)
        
        self.finishSendingMessage(animated: true)
        
    }
    
    override func viewClass(forItem item: QBChatMessage!) -> AnyClass! {
        return QMChatIncomingCell.self
    }
    
    override func collectionView(_ collectionView: QMChatCollectionView!, minWidthAt indexPath: IndexPath!) -> CGFloat {
        let item = self.chatDataSource.message(for: indexPath)
        let attributedString = item?.senderID == self.senderID ? self.bottomLabelAttributedString(forItem: item) : self.topLabelAttributedString(forItem: item)
        
        let size = TTTAttributedLabel.sizeThatFitsAttributedString(attributedString, withConstraints: CGSize(width:1000, height:10000), limitedToNumberOfLines: 1)
        
        return max(size.width,90)
    }
    
    override func collectionView(_ collectionView: QMChatCollectionView!, dynamicSizeAt indexPath: IndexPath!, maxWidth: CGFloat) -> CGSize {
        let item = self.chatDataSource.message(for: indexPath)
        var size = CGSize(width: min(200,maxWidth), height: 200)
        let attributedString = self.attributedString(forItem: item)
        
        size = TTTAttributedLabel.sizeThatFitsAttributedString(attributedString, withConstraints: CGSize(width:maxWidth, height:CGFloat(MAXFLOAT)), limitedToNumberOfLines: 0)
        
        return size
    }
    
    override func attributedString(forItem messageItem: QBChatMessage!) -> NSAttributedString! {
        let textColor = messageItem.senderID == self.senderID ? UIColor.darkGray : UIColor(white: 0.29, alpha: 1.0)
        let font = UIFont.systemFont(ofSize: 14)
        let attributedString = NSAttributedString(string: messageItem.text!, attributes: [NSAttributedStringKey.foregroundColor: textColor,NSAttributedStringKey.font:font])
        return attributedString
    }
    
    override func topLabelAttributedString(forItem messageItem: QBChatMessage!) -> NSAttributedString! {
        
        let textColor = UIColor(red: 0.184, green: 0.467, blue: 0.733, alpha: 1.0)
        let font = UIFont.systemFont(ofSize: 13)
        
        let name = messageItem.senderResource ?? ""
        let attributedString = NSAttributedString(string: name, attributes: [NSAttributedStringKey.foregroundColor: textColor,NSAttributedStringKey.font:font])
        return attributedString
    }
    
    override func bottomLabelAttributedString(forItem messageItem: QBChatMessage!) -> NSAttributedString! {
        let textColor = UIColor(white: 0.00, alpha: 0.49)
        let font = UIFont.systemFont(ofSize: 12)
        let attributedString = NSAttributedString(string: self.timeStampWithDate(date: messageItem.dateSent!), attributes: [NSAttributedStringKey.foregroundColor: textColor,NSAttributedStringKey.font:font])
        return attributedString
    }
    
    override func collectionView(_ collectionView: QMChatCollectionView!, layoutModelAt indexPath: IndexPath!) -> QMChatCellLayoutModel {
        var layoutModel = super.collectionView(collectionView, layoutModelAt: indexPath)
        layoutModel.avatarSize = CGSize(width: 0, height: 0)
        return layoutModel
    }
    
    
    func timeStampWithDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    

}
