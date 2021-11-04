//
//  MessageManager.swift
//  Ex-3-simple-chat
//
//  Created by Daniela Paola Beltran Saavedra on 28/10/21.
//

import UIKit
import Foundation

class MessageManager {
    
    func retrieve(onCompletion: @escaping (Result<[Message],APIError>) -> Void){
        let url = Bundle.main.url(forResource: "messages", withExtension: "json")
        guard let myUrl = url else {
            onCompletion(.failure(.fileNotFound))
            return
        }
        guard let myData = try? Data(contentsOf: myUrl) else{
            onCompletion(.failure(.invalidData))
            return
        }
        do{
            let messages = try JSONDecoder().decode([Message].self, from: myData)
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
