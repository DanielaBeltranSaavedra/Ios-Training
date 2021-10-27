//
//  ViewController.swift
//  Ex-3-simple-chat
//
//  Created by Daniela Paola Beltran Saavedra on 27/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()
        // Do any additional setup after loading the view.
    }
    
    private func parseJson(){
        guard let path = Bundle.main.path(forResource: "messages", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let jsonData = try Data(contentsOf: url)
        }
        catch{
            print("Error: \(error)")
        }
    }

}

