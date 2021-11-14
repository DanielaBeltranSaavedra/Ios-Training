//
//  Talk.swift
//  Ex-TedTalks
//
//  Created by Daniela Paola Beltran Saavedra on 10/11/21.
//

import UIKit
import Foundation

struct Talk: Decodable {
    var comments: Int
    var description: String
    var duration: Int
    var event: String
    var film_date: Int
    var languages: Int
    var main_speaker: String
    var name: String
    var num_speaker: Int
    var published_date: Int
    var speaker_occupation: String
    var tags: [String]
    var title: String
    var url: String
}

