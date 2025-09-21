import XCTest
// 使用 @testable import 来访问主应用中 internal 级别的代码
@testable import BDDNativeTestDemo

final class ShoppingCartBDDTests: XCTestCase {

    // MARK: - Scenario 000: Add A Product To An Empty Cart
    
    func test_000_AddProductToEmptyCart() {
        /*
         Gherkin 场景:
         Given I am a logged-in user
         And my shopping cart is empty
         When I add the product "iPhone 18" to the cart
         Then I should see "1" item in the cart
         And the total price of the cart should be "1299.00" yuan
        */
        
        // MARK: - Given
        // "I am a logged-in user" -> 对于单元测试，我们假设此条件已满足，专注于购物车逻辑
        // "my shopping cart is empty"
        var cart = ShoppingCart()
        
        // MARK: - When
        // "I add the product "iPhone 18" to the cart"
        let iphone18 = Product(name: "iPhone 18", price: Decimal(string: "1299.00")!)
        cart.add(iphone18)
        
        // MARK: - Then
        // "I should see "1" item in the cart"
        XCTAssertEqual(cart.itemCount, 1, "购物车中应该有 1 件商品")
        
        // "And the total price of the cart should be "1299.00" yuan"
        XCTAssertEqual(cart.totalPrice, Decimal(string: "1299.00")!, "购物车总价应该是 1299.00")
    }

    // MARK: - Scenario 001: Add A Second Product To The Cart
    
    func test_001_AddSecondProductToCart() {
        /*
         Gherkin 场景:
         Given my shopping cart already has "1" item with a total price of "1299.00" yuan
         When I add the product "iPhone 18" to the cart
         Then I should see "2" items in the cart
         And the total price of the cart should be "2598.00" yuan
        */
        
        // MARK: - Given
        // "my shopping cart already has "1" item with a total price of "1299.00" yuan"
        var cart = ShoppingCart()
        let iphone18 = Product(name: "iPhone 18", price: Decimal(string: "1299.00")!)
        cart.add(iphone18) // 先添加一件商品，创造初始条件
        
        // MARK: - When
        // "I add the product "iPhone 18" to the cart"
        cart.add(iphone18) // 再次添加相同的商品
        
        // MARK: - Then
        // "I should see "2" items in the cart"
        XCTAssertEqual(cart.itemCount, 2, "购物车中应该有 2 件商品")
        
        // "And the total price of the cart should be "2598.00" yuan"
        XCTAssertEqual(cart.totalPrice, Decimal(string: "2598.00")!, "购物车总价应该是 2598.00")
    }
}
