//
//  PurchaseButton.swift
//  VendingMachineApp
//
//  Created by 岡澤輝明 on 2021/03/07.
//

import Foundation

final class DrinkManagement: ViewController {
    // 購入ドリンク数
    var waterNumber = 0
    var strawberryOdenNumber = 0
    var palmFruitCiderNumber = 0
    var habaneroPineappleJuiceNumber = 0
    // 購入ドリンク数を増やす
    func increasePossessionDrink(increaseDrink: purchaseButtonTag) {
        switch increaseDrink {
        case .waterButton:
            waterNumber += 1
        case .strawberryOdenButton:
            strawberryOdenNumber += 1
        case .palmFruitCiderButton:
            palmFruitCiderNumber += 1
        case .habaneroPineappleJuiceButton:
            habaneroPineappleJuiceNumber += 1
        }
    }
    
    // ドリンク在庫数
    var waterStock = 10
    var strawberryOdenStock = 15
    var palmFruitCiderStock = 3
    var habaneroPineappleJuiceStock = 5
    // 購入時、ドリンク在庫数を減らす
    func decreaseDrinkStock(decreaseDrink: purchaseButtonTag) {
        switch decreaseDrink {
        case .waterButton:
            waterStock -= 1
        case .strawberryOdenButton:
            strawberryOdenStock -= 1
        case .palmFruitCiderButton:
            palmFruitCiderStock -= 1
        case .habaneroPineappleJuiceButton:
            habaneroPineappleJuiceStock -= 1
        }
    }
    static let drinkManagement = DrinkManagement()
}
