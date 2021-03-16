//
//  ChangeManagement.swift
//  VendingMachineApp
//
//  Created by 岡澤輝明 on 2021/03/07.
//

import Foundation

final class ChangeManagement: ViewController {
    // 初期所持金
    var tenYenPossession = 25
    var fiftyYenPossession = 10
    var oneHundredYenPossession = 20
    var fiveHundredYenPossession = 5
    
    // 釣り銭初期残高
    var tenYenStock = 50
    var fiftyYenStock = 20
    var oneHundredYenStock = 3
    var fiveHundredYenStock = 10
    
    // 投入硬貨枚数を数える
    var tenYenPutSheets = 0
    var fiftyYenPutSheets = 0
    var oneHundredYenPutSheets = 0
    var fiveHundredYenPutSheets = 0
    
    // 購入時、所持金を減らす関数
    func reducePosessionMoney(putMoneyTag: putMoneyButtonTag) {
        switch putMoneyTag {
        case .tenYen:
            tenYenPossession -= 1
        case .fiftyYen:
            fiftyYenPossession -= 1
        case .oneHundredYen:
            oneHundredYenPossession -= 1
        case .fiveHundredYen:
            fiveHundredYenPossession -= 1
        }
    }
    
    // 釣り銭を補充する関数
    func increaseChange(increaseMoney: putMoneyButtonTag) {
        switch increaseMoney {
        case .tenYen:
            tenYenStock += 1
        case .fiftyYen:
            fiftyYenStock += 1
        case .oneHundredYen:
            oneHundredYenStock += 1
        case .fiveHundredYen:
            fiveHundredYenStock += 1
        }
    }
    
    // 投入硬貨枚数を数える関数
    func putMoneySheetsLimit(putMoneyTag: putMoneyButtonTag) {
        switch putMoneyTag {
        case .tenYen:
            tenYenPutSheets += 1
        case .fiftyYen:
            fiftyYenPutSheets += 1
        case .oneHundredYen:
            oneHundredYenPutSheets += 1
        case .fiveHundredYen:
            fiveHundredYenPutSheets += 1
        }
    }
    
    // おつりボタン押下時、投入硬貨枚数をリセットする関数
    func resetPutMoneySheetsLimit() {
        tenYenPutSheets = 0
        fiftyYenPutSheets = 0
        oneHundredYenPutSheets = 0
        fiveHundredYenPutSheets = 0
    }
    
    // おつりを出すための変数
    var putOutTotalPutMoney = 0
    // おつり分の釣り銭残高を減らす関数
    func putOutChange(totalAddPutMoney: Int) {
        putOutTotalPutMoney = totalAddPutMoney
        while putOutTotalPutMoney >= 0 {
            if putOutTotalPutMoney >= 500 {
                putOutTotalPutMoney -= 500
                fiveHundredYenStock -= 1
                fiveHundredYenPossession += 1
                continue
            }
            if putOutTotalPutMoney >= 100 {
                putOutTotalPutMoney -= 100
                oneHundredYenStock -= 1
                oneHundredYenPossession += 1
                continue
            }
            if putOutTotalPutMoney >= 50 {
                putOutTotalPutMoney -= 50
                fiftyYenStock -= 1
                fiftyYenPossession += 1
                continue
            }
            if putOutTotalPutMoney >= 10 {
                putOutTotalPutMoney -= 10
                tenYenStock -= 1
                tenYenPossession += 1
                continue
            }
            if putOutTotalPutMoney < 10 {
                putOutTotalPutMoney -= putOutTotalPutMoney
                break
            }
        }
    }
    public static let changeManagement = ChangeManagement()
}
