//
//  StockViewController.swift
//  VendingMachineApp
//
//  Created by 岡澤輝明 on 2021/03/06.
//

import UIKit

class StockViewController: UIViewController {
    
    @IBOutlet weak var tenYenStockLabel: UILabel!
    @IBOutlet weak var fiftyYenStockLabel: UILabel!
    @IBOutlet weak var oneHundredYenStockLabel: UILabel!
    @IBOutlet weak var fiveHundredYenStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tenYenStockLabel.text = String("\(changeManagement.tenYenStock)枚")
        fiftyYenStockLabel.text = String("\(changeManagement.fiftyYenStock)枚")
        oneHundredYenStockLabel.text = String("\(changeManagement.oneHundredYenStock)枚")
        fiveHundredYenStockLabel.text = String("\(changeManagement.fiveHundredYenStock)枚")
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
