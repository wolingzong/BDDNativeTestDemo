# BDD 风格测试：使用原生 XCTest

这是一个简单的 Swift 示例项目，旨在演示如何在**不引入任何第三方库**的情况下，使用苹果原生的 **XCTest** 框架来实践**行为驱动开发 (Behavior-Driven Development, BDD)** 的核心思想。

项目通过测试一个基础的 `ShoppingCart` 模型，展示了如何将自然语言描述的业务场景转化为结构清晰、易于维护的单元测试。

## 核心理念：轻量级 BDD

与使用 `Quick/Nimble` 或 `Gherkin` 等专用框架不同，本项目采用了一种更轻量级的方法，通过遵循简单的**命名规范**和**代码结构**来模拟 BDD 的 `Given-When-Then` 流程。

*   **函数命名**: 测试函数名直接反映其测试的场景，例如 `test_000_AddProductToEmptyCart()`。
*   **代码结构**: 在函数内部，使用 `// MARK: - Given`, `// MARK: - When`, `// MARK: - Then` 注释来划分代码块，使其与 BDD 步骤一一对应。

这种方法的优势在于**零依赖、零配置、上手快**。

## 🛠️ 技术栈

*   **Swift**: 项目的主要开发语言。
*   **Xcode**: 用于开发和运行测试。
*   **XCTest**: 苹果官方的原生测试框架，本项目完全基于此框架。

## 🚀 如何开始

### 准备工作

*   确保您已安装最新版本的 Xcode。
*   本项目**不依赖**任何第三方库，无需使用 Swift Package Manager, CocoaPods 或 Carthage。

### 运行项目

1.  克隆本仓库到您的本地电脑：
    ```bash
    git clone [您的仓库HTTPS链接]
    ```
2.  使用 Xcode 打开项目根目录下的 `.xcodeproj` 文件即可。

## ✅ 运行测试

这是本项目的核心部分。

1.  在 Xcode 中，打开测试导航器 (左侧面板的菱形图标)。
2.  您可以通过以下任一方式运行所有测试：
    *   使用快捷键 **`Cmd + U` (⌘U)**。
    *   点击顶部菜单栏 `Product` -> `Test`。
3.  您也可以在代码编辑器中，点击 `ShoppingCartBDDTests.swift` 文件里每个测试函数旁边的菱形播放按钮，来单独运行某个场景。

当所有测试通过时，您会在 Xcode 中看到绿色的对勾标记。

## 📄 测试场景 (Feature File)

我们的测试代码严格遵循了以下用 Gherkin 语法描述的业务需求：

```gherkin
Feature: ShoppingCartTests
  As a user, I want to add products to my shopping cart and see the total price update correctly.

  Scenario: 000 Add A Product To An Empty Cart
    Given I am a logged-in user
    And my shopping cart is empty
    When I add the product "iPhone 18" to the cart
    Then I should see "1" item in the cart
    And the total price of the cart should be "1299.00" yuan

  Scenario: 001 Add A Second Product To The Cart
    Given my shopping cart already has "1" item with a total price of "1299.00" yuan
    When I add the product "iPhone 18" to the cart
    Then I should see "2" items in the cart
    And the total price of the cart should be "2598.00" yuan
```

## 📄 从场景到代码

以下是 `ShoppingCartBDDTests.swift` 中的一个示例，它展示了如何将上述第一个场景转化为 XCTest 代码：

```swift
// Scenario: 000 Add A Product To An Empty Cart
func test_000_AddProductToEmptyCart() {
    
    // MARK: - Given
    // "I am a logged-in user" -> 假设已满足
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
```

如您所见，测试代码的结构与 Gherkin 场景描述高度一致，这使得代码本身就成为了一份清晰的“活文档”。

## 📄 许可证

本项目采用 [MIT 许可证](https://opensource.org/licenses/MIT)。
