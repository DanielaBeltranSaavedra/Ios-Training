//
//  APIError.swift
//  Ex-TedTalks
//
//  Created by Daniela Paola Beltran Saavedra on 10/11/21.
//

import UIKit

enum APIError: Error {
    
    case fileNotFound
    case invalidData
    case decodingProblem(String)
}
