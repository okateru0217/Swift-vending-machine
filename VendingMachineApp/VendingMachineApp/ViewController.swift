//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 岡澤輝明 on 2021/03/06.
//

import UIKit

class ViewController: UIViewController {
    
    // 投入金額ラベル
    @IBOutlet weak var putMoney: UILabel!
    // 購入ボタン
    @IBOutlet weak var waterPurchaseButton: UIButton!
    @IBOutlet weak var strawberryOdenPurchaseButton: UIButton!
    @IBOutlet weak var palmFruitCiderPurchaseButton: UIButton!
    @IBOutlet weak var habaneroPineappleJuicePurchaseButton: UIButton!
    // 購入数ラベル
    @IBOutlet weak var waterPurchaseNumberLabel: UILabel!
    @IBOutlet weak var strawberryOdenPurchaseNumberLabel: UILabel!
    @IBOutlet weak var palmFruitCiderPurchaseNumberLabel: UILabel!
    @IBOutlet weak var habaneroPineappleJuicePurchaseNumberLabel: UILabel!
    
    // 投入金額
    var addPutMoney: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allPurchaseButtonLit()
        // Do any additional setup after loading the view.
    }
    
    // 購入可否に応じて、「購入」ボタンの見た目を変える
    func purchaseButtonLit(purchaseButton: UIButton, price: Int, stock: Int) {
        if addPutMoney >= price && stock > 0 {
            purchaseButton.backgroundColor = .systemGreen
            purchaseButton.setTitle("購入", for: .normal)
            purchaseButton.isEnabled = true
        } else if addPutMoney < price && stock > 0 {
            purchaseButton.backgroundColor = .lightGray
            purchaseButton.setTitle("購入", for: .normal)
            purchaseButton.isEnabled = false
        } else {
            purchaseButton.backgroundColor = .systemRed
            purchaseButton.setTitle("売切", for: .normal)
            purchaseButton.isEnabled = false
        }
    }
    // purchaseButtonLit関数を一括で適応させるための関数
    func allPurchaseButtonLit() {
        purchaseButtonLit(purchaseButton: waterPurchaseButton, price: 100, stock: drinkManagement.waterStock)
        purchaseButtonLit(purchaseButton: strawberryOdenPurchaseButton, price: 120, stock: drinkManagement.strawberryOdenStock)
        purchaseButtonLit(purchaseButton: palmFruitCiderPurchaseButton, price: 140, stock: drinkManagement.palmFruitCiderStock)
        purchaseButtonLit(purchaseButton: habaneroPineappleJuicePurchaseButton, price: 200, stock: drinkManagement.habaneroPineappleJuiceStock)
    }
    
    enum purchaseButtonTag: Int {
        case waterButton = 1
        case strawberryOdenButton = 2
        case palmFruitCiderButton = 3
        case habaneroPineappleJuiceButton = 4
    }
    // 「購入」ボタン押下時の処理
    @IBAction func purchaseButton(_ sender: Any) {
        let buttonTag: UIButton = sender as! UIButton
        let tag = purchaseButtonTag(rawValue: buttonTag.tag)
        // ドリンク購入数を増やす
        drinkManagement.increasePossessionDrink(increaseDrink: ViewController.purchaseButtonTag(rawValue: buttonTag.tag)!)
        // ドリンク在庫数を減らす
        drinkManagement.decreaseDrinkStock(decreaseDrink: ViewController.purchaseButtonTag(rawValue: buttonTag.tag)!)
        switch tag {
        case .waterButton:
            addPutMoney -= 100
            putMoney.text = String("\(addPutMoney)円")
            waterPurchaseNumberLabel.text = String("\(drinkManagement.waterNumber)本")
            allPurchaseButtonLit()
        case .strawberryOdenButton:
            addPutMoney -= 120
            putMoney.text = String("\(addPutMoney)円")
            strawberryOdenPurchaseNumberLabel.text = String("\(drinkManagement.strawberryOdenNumber)本")
            allPurchaseButtonLit()
        case .palmFruitCiderButton:
            addPutMoney -= 140
            putMoney.text = String("\(addPutMoney)円")
            palmFruitCiderPurchaseNumberLabel.text = String("\(drinkManagement.palmFruitCiderNumber)本")
            allPurchaseButtonLit()
        case .habaneroPineappleJuiceButton:
            addPutMoney -= 200
            putMoney.text = String("\(addPutMoney)円")
            habaneroPineappleJuicePurchaseNumberLabel.text = String("\(drinkManagement.habaneroPineappleJuiceNumber)本")
            allPurchaseButtonLit()
        default: break
        }
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
        allPurchaseButtonLit()
        // 釣り銭残高を増やす
        changeManagement.increaseChange(increaseMoney: ViewController.putMoneyButtonTag(rawValue: buttonTag.tag)!)
    }
}
