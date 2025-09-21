import Foundation

struct ShoppingCart {
    private var items: [Product] = []

    // 计算属性：商品数量
    var itemCount: Int {
        return items.count
    }

    // 计算属性：购物车总价
    var totalPrice: Decimal {
        // 使用 reduce 函数将所有商品价格相加
        return items.reduce(0) { $0 + $1.price }
    }

    // 添加商品的方法
    mutating func add(_ product: Product) {
        items.append(product)
    }
}
