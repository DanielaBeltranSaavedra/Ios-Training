//
//  ViewController.swift
//  ex-4-calculator
//
//  Created by Daniela Paola Beltran Saavedra on 7/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var acBtn: UIButton!
    @IBOutlet weak var plusMinusBtn: UIButton!
    @IBOutlet weak var percentageBtn: UIButton!
    @IBOutlet weak var divBtn: UIButton!
    @IBOutlet weak var sevenBtn: UIButton!
    @IBOutlet weak var eightBtn: UIButton!
    @IBOutlet weak var nineBtn: UIButton!
    var operationResult: Float = 0
    var selectNumber: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
        result.text = String (0)

        // Do any additional setup after loading the view.
    }
    @IBAction func selectSeven(_ sender: UIButton) {
        selectNumber = 7
        if(operationResult == 0){
            result.text = String (selectNumber)
            operationResult = selectNumber
            
        }else{
            print(operationResult)
            result.text = String(Int(operationResult)) + String(Int(selectNumber))
           // operationResult = Float(result.text)
        }
    }
    
    @IBAction func selectEight(_ sender: UIButton) {
        operationResult = 8
        result.text = String (8)
    }
    
    @IBAction func selectNine(_ sender: UIButton) {
        operationResult = 9
        result.text = String (9)
    }
    
    @IBAction func selectFour(_ sender: UIButton) {
        operationResult = 4
        result.text = String (4)
    }
    @IBAction func selectFive(_ sender: UIButton) {
        operationResult = 5
        result.text = String (5)
    }
    
    @IBAction func selectSix(_ sender: UIButton) {
        operationResult = 6
        result.text = String (6)
    }
    @IBAction func selectOne(_ sender: UIButton) {
        operationResult = 1
        result.text = String (1)
    }
    @IBAction func selectTwo(_ sender: UIButton) {
        operationResult = 2
        result.text = String (2)
    }
    @IBAction func selectThree(_ sender: UIButton) {
        operationResult = 3
        result.text = String (3)
    }
    @IBAction func selectZero(_ sender: UIButton) {
        operationResult = 0
        result.text = String (0)
    }
}

