//
//  ChatViewController.swift
//  Ex-3-simple-chat
//
//  Created by Daniela Paola Beltran Saavedra on 28/10/21.
//

import UIKit
import MessageKit

struct Sender: SenderType{
    var displayName: String
    
    var senderId: String
}

class Messages:MessageType{
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    init(sender:SenderType, messageId:String, sentDate:Date,kind:MessageKind){
        self.sender = sender
        self.messageId = messageId
        self.sentDate = sentDate
        self.kind = kind
    }
}


class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate,MessagesDisplayDelegate{
    let me = Sender(displayName:"Me" , senderId: "1")
    
    var messages = [MessageType]()
    
    func currentSender() -> SenderType {
        <#code#>
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        <#code#>
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        <#code#>
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(Messages(sender: me, messageId: "1", sentDate: Date, kind: MessageKind))
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
   

}
