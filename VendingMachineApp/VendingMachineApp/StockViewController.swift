//
//  StockViewController.swift
//  VendingMachineApp
//
//  Created by 岡澤輝明 on 2021/03/06.
//

import UIKit

class StockViewController: UIViewController {
    // ドリンク在庫数ラベル
    @IBOutlet weak var waterStockLabel: UILabel!
    @IBOutlet weak var strawberryOdenStockLabel: UILabel!
    @IBOutlet weak var palmFruitCiderStockLabel: UILabel!
    @IBOutlet weak var habaneroPineappleJuiceStockLabel: UILabel!

    // 釣り銭残高ラベル
    @IBOutlet weak var tenYenStockLabel: UILabel!
    @IBOutlet weak var fiftyYenStockLabel: UILabel!
    @IBOutlet weak var oneHundredYenStockLabel: UILabel!
    @IBOutlet weak var fiveHundredYenStockLabel: UILabel!
    
    let viewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ドリンク在庫数ラベル
        waterStockLabel.text = String("\(drinkManagement.waterStock)本")
        strawberryOdenStockLabel.text = String("\(drinkManagement.strawberryOdenStock)本")
        palmFruitCiderStockLabel.text = String("\(drinkManagement.palmFruitCiderStock)本")
        habaneroPineappleJuiceStockLabel.text = String("\(drinkManagement.habaneroPineappleJuiceStock)本")
        
        // 釣り銭残高ラベル
        tenYenStockLabel.text = String("\(changeManagement.tenYenStock)枚")
        fiftyYenStockLabel.text = String("\(changeManagement.fiftyYenStock)枚")
        oneHundredYenStockLabel.text = String("\(changeManagement.oneHundredYenStock)枚")
        fiveHundredYenStockLabel.text = String("\(changeManagement.fiveHundredYenStock)枚")
        // Do any additional setup after loading the view.
    }
    
    // 飲み物補充ボタンのタグ
    enum replenishmentDrinkButtonTag: Int {
        case replenishmentWaterButton = 1
        case replenishmentStrawberryOdenButton = 2
        case replenishmentPalmFruitCiderButton = 3
        case replenishmenthabaneroPineappleJuiceButton = 4
    }
    // 飲み物補充ボタン押下時の処理
    @IBAction func replenishmentDrinkButton(_ sender: Any) {
        let buttonTag: UIButton = sender as! UIButton
        let tag = replenishmentDrinkButtonTag(rawValue: buttonTag.tag)
        switch tag {
        case .replenishmentWaterButton:
            drinkManagement.waterStock += 1
            waterStockLabel.text = String("\(drinkManagement.waterStock)本")
        case .replenishmentStrawberryOdenButton:
            drinkManagement.strawberryOdenStock += 1
            strawberryOdenStockLabel.text = String("\(drinkManagement.strawberryOdenStock)本")
        case .replenishmentPalmFruitCiderButton:
            drinkManagement.palmFruitCiderStock += 1
            palmFruitCiderStockLabel.text = String("\(drinkManagement.palmFruitCiderStock)本")
        case .replenishmenthabaneroPineappleJuiceButton:
            drinkManagement.habaneroPineappleJuiceStock += 1
            habaneroPineappleJuiceStockLabel.text = String("\(drinkManagement.habaneroPineappleJuiceStock)本")
        default:break
        }
    }
    
    // 釣り銭補充ボタンのタグ
    enum replenishmentChangeButtonTag: Int {
        case replenishmentTenYenButton = 1
        case replenishmentFiftyYenButton = 2
        case replenishmentOneHundredButton = 3
        case replenishmentFiveHundredButton = 4
    }
    // 釣り銭補充ボタン押下時の処理
    @IBAction func replenishmentChangeButton(_ sender: Any) {
        let buttonTag: UIButton = sender as! UIButton
        let tag = replenishmentChangeButtonTag(rawValue: buttonTag.tag)
        switch tag {
        case .replenishmentTenYenButton:
            changeManagement.tenYenStock += 1
            tenYenStockLabel.text = String("\(changeManagement.tenYenStock)枚")
        case .replenishmentFiftyYenButton:
            changeManagement.fiftyYenStock += 1
            fiftyYenStockLabel.text = String("\(changeManagement.fiftyYenStock)枚")
        case .replenishmentOneHundredButton:
            changeManagement.oneHundredYenStock += 1
            oneHundredYenStockLabel.text = String("\(changeManagement.oneHundredYenStock)枚")
        case .replenishmentFiveHundredButton:
            changeManagement.fiveHundredYenStock += 1
            fiveHundredYenStockLabel.text = String("\(changeManagement.fiveHundredYenStock)枚")
        default:break
        }
    }
}
