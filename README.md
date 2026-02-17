# BlueCatButton

轻量级 Swift UI 组件，提供渐变按钮、倒计时、点击动效、加载态、主题与多状态样式等能力。

## 特性

- 渐变按钮（方向/颜色/流动动画）
- 点击高亮与缩放动效
- 倒计时（支持 $mm:ss$、前缀/后缀、完成文案）
- 加载态（菊花/自动禁用）
- 图标 + 文字布局与间距
- 主题预设与深浅色自动切换
- 多状态 Style
- 触感反馈（强度策略）
- 高亮叠层颜色/渐变
- 闪烁态（轻量骨架屏）
- 角标/徽标
- 最小触控区域与自动布局
- onTap 闭包与节流/防抖

## 安装

### CocoaPods

```ruby
pod 'blueCatButton', :git => 'https://github.com/feather2222/blueCatButton.git', :tag => '0.1.0'
```

### Swift Package Manager

Xcode → File → Add Packages… → 输入仓库地址：

```
https://github.com/feather2222/blueCatButton.git
```

### 手动集成

将生成的 `BlueCatButton.framework` 拖入项目，并在 **Frameworks, Libraries, and Embedded Content** 中设置为 **Embed & Sign**。

## 快速开始

```swift
import UIKit
import blueCatButton

final class ViewController: UIViewController {
	private let actionButton = BlueCatButton()

	override func viewDidLoad() {
		super.viewDidLoad()

		actionButton.setTitle("领取奖励", for: .normal)
		actionButton.gradientColors = [UIColor.systemPink, UIColor.systemOrange]
		actionButton.gradientDirection = .topLeftToBottomRight
		actionButton.cornerRadius = 16
		actionButton.enableClickAnimation = true

		actionButton.onTap = { [weak self] _ in
			self?.actionButton.startCountdown(seconds: 10, suffix: "s", normalTitle: "领取奖励")
		}

		actionButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(actionButton)
		NSLayoutConstraint.activate([
			actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}
}
```

## 进阶用法

### 主题预设与深浅色自动切换

```swift
let theme = BlueCatButton.theme(for: .primary)
+actionButton.applyTheme(theme, followSystem: true)
```

### 多状态 Style

```swift
let normalStyle = BlueCatButton.Style(gradientColors: [UIColor.systemBlue, UIColor.systemPurple])
let disabledStyle = BlueCatButton.Style(gradientColors: [UIColor.systemGray3, UIColor.systemGray])
actionButton.setStyle(normalStyle, for: .normal)
actionButton.setStyle(disabledStyle, for: .disabled)
```

### onTap 节流/防抖

```swift
actionButton.tapStrategy = .throttle(0.8)
```

### 渐变流动动画

```swift
actionButton.startGradientFlowAnimation(duration: 2.8, direction: .leftToRight)
```

### 闪烁态（轻量骨架屏）

```swift
actionButton.isShimmering = true
actionButton.shimmerDuration = 1.6
```

### 标题渐变/描边

```swift
actionButton.titleStyle = .gradient(colors: [UIColor.systemPink, UIColor.systemOrange], direction: .leftToRight)
// 或
actionButton.titleStyle = .stroke(color: .white, width: 2)
```

### 角标/徽标

```swift
actionButton.badgeText = "9+"
actionButton.badgeBackgroundColor = .systemRed
actionButton.badgeOffset = CGPoint(x: 8, y: -8)
```

### async 任务绑定（自动结束加载态）

```swift
actionButton.performLoadingTask {
	try? await Task.sleep(nanoseconds: 1_000_000_000)
}
```

## 兼容性

- iOS 12.0+
- Swift 5.0+

## License

MIT License. See [LICENSE](LICENSE).
