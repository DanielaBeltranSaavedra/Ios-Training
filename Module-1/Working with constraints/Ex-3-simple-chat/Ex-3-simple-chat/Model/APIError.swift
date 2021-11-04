//
//  APIError.swift
//  Ex-3-simple-chat
//
//  Created by Daniela Paola Beltran Saavedra on 28/10/21.
//

import UIKit

enum APIError: Error{
    case fileNotFound
    case invalidData
    case decodingProblem(String)
}

