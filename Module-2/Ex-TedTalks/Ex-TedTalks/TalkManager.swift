//
//  TalkManager.swift
//  Ex-TedTalks
//
//  Created by Daniela Paola Beltran Saavedra on 10/11/21.
//

import UIKit
import Foundation

class TalkManager {
    
    func retrieve(onCompletion: @escaping (Result<[Talk],APIError>) -> Void){
        let url = Bundle.main.url(forResource: "tedTalks", withExtension: "json")
        guard let myUrl = url else {
            onCompletion(.failure(.fileNotFound))
            return
        }
        guard let myData = try? Data(contentsOf: myUrl) else{
            onCompletion(.failure(.invalidData))
            return
        }
        do{
            let messages = try JSONDecoder().decode([Talk].self, from: myData)
            onCompletion(.success(messages))
        }catch DecodingError.dataCorrupted(_){
            onCompletion(.failure(.decodingProblem("Data corrupted")))
        }catch DecodingError.keyNotFound(let codingKey, _){
            onCompletion(.failure(.decodingProblem(codingKey.stringValue)))
        }catch let error{
            onCompletion(.failure(.decodingProblem(error.localizedDescription)))
        }
    }
}
