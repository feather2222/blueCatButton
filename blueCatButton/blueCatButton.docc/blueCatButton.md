# ``blueCatButton``

轻量级 UI 组件库，提供支持渐变、倒计时和点击动效的 `BlueCatButton`。

## Overview

`BlueCatButton` 是一个轻量级的自定义按钮：
- 支持渐变方向与颜色
- 支持渐变动画（颜色/方向平滑过渡）
- 支持圆角
- 支持点击高亮与缩放动效
- 支持倒计时（按钮自动禁用并展示剩余时间）
- 支持加载态（菊花/替换标题）
- 支持图标+文字布局（上下/左右/间距）
- 支持触感反馈（点击时）
- 支持阴影/描边
- 支持倒计时格式（秒或 mm:ss）与完成态文案
- 支持主题预设与深浅色自动切换
- 支持 onTap 闭包与节流/防抖策略
- 支持自动布局与最小触控区域
- 支持闪烁态（轻量骨架屏）
- 支持高亮叠层颜色/渐变
- 支持多状态 Style
- 支持细化事件回调（onTouchDown / onTouchUpInside / onLongPress）
- 支持禁用态自动降亮度/降饱和度
- 支持角标/徽标
- 支持内容对齐配置
- 支持 async 任务绑定自动结束加载态
- 支持标题渐变/描边
- 支持触感反馈强度策略

## 使用示例

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

		actionButton.addTarget(self, action: #selector(handleTap), for: .touchUpInside)

		actionButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(actionButton)
		NSLayoutConstraint.activate([
			actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			actionButton.widthAnchor.constraint(equalToConstant: 200),
			actionButton.heightAnchor.constraint(equalToConstant: 52)
		])
	}

	@objc private func handleTap() {
		actionButton.startCountdown(seconds: 10, suffix: "s", normalTitle: "领取奖励")
	}
}
```

### 渐变动画

```swift
actionButton.startGradientColorAnimation(
	colors: [
		[UIColor.systemPink, UIColor.systemOrange],
		[UIColor.systemBlue, UIColor.systemPurple],
		[UIColor.systemGreen, UIColor.systemTeal]
	],
	duration: 3.0,
	autoreverses: true
)

actionButton.startGradientDirectionAnimation(
	directions: [.leftToRight, .topToBottom, .bottomLeftToTopRight],
	duration: 3.0,
	autoreverses: true
)
```

### 加载态

```swift
actionButton.loadingTitle = "加载中"
actionButton.isLoading = true
```

### 图标+文字布局

```swift
actionButton.setImage(UIImage(systemName: "bolt.fill"), for: .normal)
actionButton.imagePosition = .top
actionButton.imageTitleSpacing = 6
```

### 触感反馈

```swift
actionButton.enableHaptics = true
actionButton.hapticStyle = .medium
```

### 阴影/描边

```swift
actionButton.shadowColor = UIColor.black
actionButton.shadowOpacity = 0.2
actionButton.shadowRadius = 8
actionButton.shadowOffset = CGSize(width: 0, height: 4)

actionButton.borderColor = UIColor.white
actionButton.borderWidth = 1
```

### 倒计时格式

```swift
actionButton.startCountdown(
	seconds: 95,
	prefix: "剩余 ",
	format: .minutesSeconds,
	completionTitle: "重新获取",
	normalTitle: "发送验证码"
)
```

### 主题预设与深浅色自动切换

```swift
let theme = BlueCatButton.theme(for: .primary)
actionButton.applyTheme(theme, followSystem: true)
```

### onTap 与节流/防抖

```swift
actionButton.onTap = { button in
	print("tap")
}
actionButton.tapStrategy = .throttle(0.8)
```

### 细化事件回调

```swift
actionButton.onTouchDown = { _ in
	print("down")
}
actionButton.onTouchUpInside = { _ in
	print("up inside")
}
actionButton.onLongPress = { _, state in
	if state == .began { print("long press") }
}
```

### 自动布局与最小触控区域

```swift
actionButton.contentPadding = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
actionButton.minimumHitSize = CGSize(width: 44, height: 44)
```

### 内容对齐

```swift
actionButton.setContentAlignment(.left)
```

### 闪烁态（轻量骨架屏）

```swift
actionButton.isShimmering = true
actionButton.shimmerDuration = 1.6
```

### 高亮叠层颜色/渐变

```swift
actionButton.highlightOverlayColor = UIColor.black.withAlphaComponent(0.3)
actionButton.highlightGradientColors = [UIColor.black.withAlphaComponent(0.2), UIColor.clear]
actionButton.highlightGradientDirection = .topToBottom
```

### 禁用态自动降亮度/饱和度

```swift
actionButton.enableDisabledAutoDim = true
actionButton.disabledDimmedSaturation = 0.2
actionButton.disabledDimmedBrightness = 0.8
actionButton.disabledTitleAlpha = 0.6
```

### 角标/徽标

```swift
actionButton.badgeText = "9+"
actionButton.badgeBackgroundColor = .systemRed
actionButton.badgeTextColor = .white
actionButton.badgeOffset = CGPoint(x: 8, y: -8)
```

### 多状态 Style

```swift
let normalStyle = BlueCatButton.Style(gradientColors: [UIColor.systemBlue, UIColor.systemPurple])
let disabledStyle = BlueCatButton.Style(gradientColors: [UIColor.systemGray3, UIColor.systemGray])
actionButton.setStyle(normalStyle, for: .normal)
actionButton.setStyle(disabledStyle, for: .disabled)
```

### async 任务绑定（自动结束加载态）

```swift
actionButton.performLoadingTask {
	try? await Task.sleep(nanoseconds: 1_000_000_000)
}
```

### 标题渐变/描边

```swift
actionButton.titleStyle = .gradient(colors: [UIColor.systemPink, UIColor.systemOrange], direction: .leftToRight)
// 或
actionButton.titleStyle = .stroke(color: .white, width: 2)
```

### 触感反馈强度策略

```swift
actionButton.enableHaptics = true
actionButton.hapticIntensityMode = .byTapCount
// 或
actionButton.hapticIntensityMode = .byForce
```

### 渐变流动动画

```swift
actionButton.startGradientFlowAnimation(duration: 2.8, direction: .leftToRight)
```

### 综合示例

```swift
final class DemoViewController: UIViewController {
	private let actionButton = BlueCatButton()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground

		// 主题预设 + 深浅色自动切换
		actionButton.applyTheme(BlueCatButton.theme(for: .primary), followSystem: true)

		// 多状态样式
		let normalStyle = BlueCatButton.Style(
			gradientColors: [UIColor.systemBlue, UIColor.systemPurple],
			cornerRadius: 16,
			shadowColor: UIColor.black,
			shadowOpacity: 0.15,
			shadowRadius: 8,
			shadowOffset: CGSize(width: 0, height: 4)
		)
		let disabledStyle = BlueCatButton.Style(
			gradientColors: [UIColor.systemGray3, UIColor.systemGray],
			cornerRadius: 16,
			shadowOpacity: 0
		)
		actionButton.setStyle(normalStyle, for: .normal)
		actionButton.setStyle(disabledStyle, for: .disabled)

		// 交互与布局
		actionButton.setTitle("领取奖励", for: .normal)
		actionButton.setImage(UIImage(systemName: "gift.fill"), for: .normal)
		actionButton.imagePosition = .left
		actionButton.imageTitleSpacing = 8
		actionButton.contentPadding = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
		actionButton.minimumHitSize = CGSize(width: 44, height: 44)
		actionButton.enableHaptics = true
		actionButton.tapStrategy = .throttle(0.8)

		// 高亮叠层与流动渐变
		actionButton.highlightGradientColors = [UIColor.black.withAlphaComponent(0.2), UIColor.clear]
		actionButton.highlightGradientDirection = .topToBottom
		actionButton.startGradientFlowAnimation(duration: 2.8, direction: .leftToRight)

		// onTap 回调
		actionButton.onTap = { [weak self] button in
			button.startCountdown(seconds: 8, prefix: "剩余 ", format: .minutesSeconds, completionTitle: "重新获取")
			button.isShimmering = true
			DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
				button.isShimmering = false
				button.isLoading = true
				DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
					button.isLoading = false
					self?.view.backgroundColor = .systemBackground
				}
			}
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

## Topics

### Components

- ``blueCatButton``
