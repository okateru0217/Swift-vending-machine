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
    // 投入金額
    var addPutMoney: Int = 0
    
    // 所持金ラベル
    @IBOutlet weak var tenYenPossessionLabel: UILabel!
    @IBOutlet weak var fiftyYenPossessionLabel: UILabel!
    @IBOutlet weak var oneHundredYenPossessionLabel: UILabel!
    @IBOutlet weak var fiveHundredYenPossessionLabel: UILabel!
    // 投入ボタン
    @IBOutlet weak var tenYenPossessionButton: UIButton!
    @IBOutlet weak var fiftyYenPossessionButton: UIButton!
    @IBOutlet weak var oneHundredYenPossessionButton: UIButton!
    @IBOutlet weak var fiveHundredYenPossessionButton: UIButton!
    
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
    
    // おつりラベル
    @IBOutlet weak var changeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tenYenPossessionLabel.text = String("\(changeManagement.tenYenPossession)枚")
        fiftyYenPossessionLabel.text = String("\(changeManagement.fiftyYenPossession)枚")
        oneHundredYenPossessionLabel.text = String("\(changeManagement.oneHundredYenPossession)枚")
        fiveHundredYenPossessionLabel.text = String("\(changeManagement.fiveHundredYenPossession)枚")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        allPurchaseButtonLit()
    }
    
    // 購入可否に応じて、「購入」ボタンの見た目を変更する
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
    
    // 「購入」ボタンのタグ
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
            waterPurchaseNumberLabel.text = String("\(drinkManagement.waterNumber)本")

        case .strawberryOdenButton:
            addPutMoney -= 120
            strawberryOdenPurchaseNumberLabel.text = String("\(drinkManagement.strawberryOdenNumber)本")

        case .palmFruitCiderButton:
            addPutMoney -= 140
            palmFruitCiderPurchaseNumberLabel.text = String("\(drinkManagement.palmFruitCiderNumber)本")
            
        case .habaneroPineappleJuiceButton:
            addPutMoney -= 200
            habaneroPineappleJuicePurchaseNumberLabel.text = String("\(drinkManagement.habaneroPineappleJuiceNumber)本")
            
        default: break
        }
        putMoney.text = String("\(addPutMoney)円")
        allPurchaseButtonLit()
    }
    
    // 投入可否に応じて、ボタンの見た目を変更する
    func possessionMoneyLit(possessionButton: UIButton, possesionMoney: Int) {
        if possesionMoney == 0 {
            possessionButton.backgroundColor = .lightGray
            possessionButton.isEnabled = false
        } else {
            possessionButton.backgroundColor = .systemTeal
            possessionButton.isEnabled = true
        }
    }
    // possessionMoneyLitを一括実行するための関数
    func allPossessionMoneyLit() {
        possessionMoneyLit(possessionButton: tenYenPossessionButton, possesionMoney: changeManagement.tenYenPossession)
        possessionMoneyLit(possessionButton: fiftyYenPossessionButton, possesionMoney: changeManagement.fiftyYenPossession)
        possessionMoneyLit(possessionButton: oneHundredYenPossessionButton, possesionMoney: changeManagement.oneHundredYenPossession)
        possessionMoneyLit(possessionButton: fiveHundredYenPossessionButton, possesionMoney: changeManagement.fiveHundredYenPossession)
    }
    
    // 「投入」ボタンのタグ
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
        changeManagement.reducePosessionMoney(putMoneyTag: ViewController.putMoneyButtonTag(rawValue: buttonTag.tag)!)
        switch tag {
        case .tenYen:
            addPutMoney += 10
            tenYenPossessionLabel.text = String("\(changeManagement.tenYenPossession)枚")
            
        case .fiftyYen:
            addPutMoney += 50
            fiftyYenPossessionLabel.text = String("\(changeManagement.fiftyYenPossession)枚")
            
        case .oneHundredYen:
            addPutMoney += 100
            oneHundredYenPossessionLabel.text = String("\(changeManagement.oneHundredYenPossession)枚")
            
        case .fiveHundredYen:
            addPutMoney += 500
            fiveHundredYenPossessionLabel.text = String("\(changeManagement.fiveHundredYenPossession)枚")
            
        default: break
        }
        putMoney.text = String("\(addPutMoney)円")
        allPurchaseButtonLit()
        // 釣り銭残高を増やす
        changeManagement.increaseChange(increaseMoney: ViewController.putMoneyButtonTag(rawValue: buttonTag.tag)!)
        // 所持金が0円かどうかを判断する
        allPossessionMoneyLit()
    }
    
    // 「おつり」ボタン押下時の処理
    @IBAction func changeButton(_ sender: Any) {
        // おつりラベルに、投入金額と同じ額を反映させる
        changeLabel.text = String("\(addPutMoney)円")
        changeManagement.putOutChange(totalAddPutMoney: addPutMoney)
        // 投入金額を0円にする
        addPutMoney = 0
        allPurchaseButtonLit()
        // おつりによって0円となった結果を、投入金額へ反映
        putMoney.text = String("\(changeManagement.putOutTotalPutMoney)円")
        allPossessionMoneyLit()
        // おつりによって増えた所持金を画面へ反映させる
        tenYenPossessionLabel.text = String("\(changeManagement.tenYenPossession)枚")
        fiftyYenPossessionLabel.text = String("\(changeManagement.fiftyYenPossession)枚")
        oneHundredYenPossessionLabel.text = String("\(changeManagement.oneHundredYenPossession)枚")
        fiveHundredYenPossessionLabel.text = String("\(changeManagement.fiveHundredYenPossession)枚")
    }
}
