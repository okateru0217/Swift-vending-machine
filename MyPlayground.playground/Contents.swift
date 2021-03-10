import UIKit

// 飲み物一覧
enum DrinkType: String {
    case water
    case strawberryOden
    case palmFruitCider
    case habaneroPineappleJuice
}

class Drink {
    var drink: String?
    var price: Int?
    var stock: Int?
    
    // 在庫数
    private var waterStock: Int = 10
    private var strawberryOdenStock: Int = 2
    private var palmFruitCiderStock: Int = 5
    private var habaneroPineappleJuiceStock: Int = 0
    
    // 飲み物の情報
    func buyDrink(drink: DrinkType, putMonay: Int) {
        switch drink {
        case .water:
            self.drink = "水"
            self.price = 100
            self.stock = self.waterStock
        case .strawberryOden:
            self.drink = "いちごおでん"
            self.price = 120
            self.stock = self.strawberryOdenStock
        case .palmFruitCider:
            self.drink = "ヤシの実サイダー"
            self.price = 140
            self.stock = self.palmFruitCiderStock
        case .habaneroPineappleJuice:
            self.drink = "ハバネロパイナップルジュース"
            self.price = 200
            self.stock = self.habaneroPineappleJuiceStock
        }
        
        // 投入金額が足りない場合と在庫数が0の場合の処理
        guard self.price! <= putMonay, self.stock! != 0 else {
            print("購入できませんでした")
            return
        }
        let change = putMonay - self.price!
        print("\(self.drink!)を購入できました！\nおつりは\(change)円です")
        
        // 在庫数を減らす
        switch drink {
        case .water:
            self.waterStock -= 1
        case .strawberryOden:
            self.strawberryOdenStock -= 1
        case .palmFruitCider:
            self.palmFruitCiderStock -= 1
        case .habaneroPineappleJuice:
            self.habaneroPineappleJuiceStock -= 1
        }
    }
}

let drink = Drink()
drink.buyDrink(drink: .water, putMonay: 500)
