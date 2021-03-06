//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 岡澤輝明 on 2021/03/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var putMoney: UILabel!
    
    var addPutMoney: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    enum putMoneyButtonTag: Int {
        case tenYen = 1
        case fiftyYen = 2
        case oneHundredYen = 3
        case fiveHundredYen = 4
    }
    
    // 「投入」ボタン押下時の処理
    @IBAction func putMoneyButton(_ sender: Any) {
        let buttonTag: UIButton = sender as! UIButton
        let tag = putMoneyButtonTag(rawValue: buttonTag.tag)
        switch tag {
        case .tenYen:
            addPutMoney += 10
            putMoney.text = String("\(addPutMoney)円")
        case .fiftyYen:
            addPutMoney += 50
            putMoney.text = String("\(addPutMoney)円")
        case .oneHundredYen:
            addPutMoney += 100
            putMoney.text = String("\(addPutMoney)円")
        case .fiveHundredYen:
            addPutMoney += 500
            putMoney.text = String("\(addPutMoney)円")
        default: break
        }
    }
}
