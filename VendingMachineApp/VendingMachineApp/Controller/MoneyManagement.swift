//
//  ChangeManagement.swift
//  VendingMachineApp
//
//  Created by 岡澤輝明 on 2021/03/07.
//

import Foundation

class ChangeManagement: ViewController {
    // 釣り銭初期残高
    var tenYenStock = 50
    var fiftyYenStock = 20
    var oneHundredYenStock = 100
    var fiveHundredYenStock = 10
    
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
    
    var putOutTotalPutMoney = 0
    // おつり分の釣り銭残高を減らす関数
    func putOutChange(totalAddPutMoney: Int) {
        putOutTotalPutMoney = totalAddPutMoney
        print(putOutTotalPutMoney)
        while putOutTotalPutMoney >= 0 {
            if putOutTotalPutMoney >= 500 {
                putOutTotalPutMoney -= 500
                fiveHundredYenStock -= 1
                continue
            }
            if putOutTotalPutMoney >= 100 {
                putOutTotalPutMoney -= 100
                oneHundredYenStock -= 1
                continue
            }
            if putOutTotalPutMoney >= 50 {
                putOutTotalPutMoney -= 50
                fiftyYenStock -= 1
                continue
            }
            if putOutTotalPutMoney >= 10 {
                putOutTotalPutMoney -= 10
                tenYenStock -= 1
                continue
            }
            if putOutTotalPutMoney < 10 {
                putOutTotalPutMoney -= putOutTotalPutMoney
                break
            }
        }
    }
}

let changeManagement = ChangeManagement()
