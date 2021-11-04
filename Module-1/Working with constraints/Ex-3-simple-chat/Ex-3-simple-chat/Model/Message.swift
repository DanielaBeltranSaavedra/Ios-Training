//
//  message.swift
//  Ex-3-simple-chat
//
//  Created by Daniela Paola Beltran Saavedra on 27/10/21.
//

import UIKit
import Foundation

struct Message: Decodable {
    var username: String
    var message: String
    var timeMessage: String
}
