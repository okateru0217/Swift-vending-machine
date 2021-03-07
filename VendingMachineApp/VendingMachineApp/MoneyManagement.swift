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
}

let changeManagement = ChangeManagement()
