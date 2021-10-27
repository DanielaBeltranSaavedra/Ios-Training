//
//  message.swift
//  Ex-3-simple-chat
//
//  Created by Daniela Paola Beltran Saavedra on 27/10/21.
//

import UIKit

class message {
    var userName: String
    var message: String
    var timeMessage: String
    
    init(userName: String, message: String, timeMessage: String){
        self.userName = userName
        self.message = message
        self.timeMessage = timeMessage
    }

}
