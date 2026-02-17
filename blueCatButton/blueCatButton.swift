//
//  blueCatButton.swift
//  blueCatButton
//
//  Created by xiangduojia on 2026/2/16.
//

import UIKit

public final class BlueCatButton: UIButton {
    public enum ImagePosition {
        case left
        case right
        case top
        case bottom
    }
    
    public enum CountdownFormat {
        case seconds
        case minutesSeconds
    }
    
    public enum TapStrategy {
        case none
        case debounce(TimeInterval)
        case throttle(TimeInterval)
    }
    
    public enum HapticIntensityMode {
        case fixed
        case byTapCount
        case byForce
    }
    
    public enum TitleStyle {
        case normal
        case gradient(colors: [UIColor], direction: GradientDirection)
        case stroke(color: UIColor, width: CGFloat)
    }
    
    public struct Theme {
        public var light: Style
        public var dark: Style
        
        public init(light: Style, dark: Style) {
            self.light = light
            self.dark = dark
        }
    }
    
    public enum ThemePreset {
        case primary
        case success
        case warning
        case danger
        case neutral
    }
    
    public struct Style {
        public var gradientColors: [UIColor]
        public var gradientDirection: GradientDirection
        public var cornerRadius: CGFloat
        public var cornerMask: UIRectCorner
        public var enableHighlightEffect: Bool
        public var highlightAlpha: CGFloat
        public var highlightOverlayColor: UIColor
        public var highlightGradientColors: [UIColor]?
        public var highlightGradientDirection: GradientDirection
        public var enableClickAnimation: Bool
        public var clickScale: CGFloat
        public var clickAnimationDuration: TimeInterval
        public var enableHaptics: Bool
        public var hapticStyle: UIImpactFeedbackGenerator.FeedbackStyle
        public var hapticIntensityMode: HapticIntensityMode
        public var enableDebounce: Bool
        public var debounceInterval: TimeInterval
        public var tapStrategy: TapStrategy
        public var imagePosition: ImagePosition
        public var imageTitleSpacing: CGFloat
        public var contentPadding: UIEdgeInsets
        public var minimumHitSize: CGSize
        public var contentAlignment: UIControl.ContentHorizontalAlignment
        public var titleStyle: TitleStyle
        public var loadingTitle: String?
        public var loadingIndicatorColor: UIColor
        public var shadowColor: UIColor?
        public var shadowOpacity: Float
        public var shadowRadius: CGFloat
        public var shadowOffset: CGSize
        public var borderColor: UIColor?
        public var borderWidth: CGFloat
        
        public init(
            gradientColors: [UIColor] = [UIColor.systemBlue, UIColor.systemPurple],
            gradientDirection: GradientDirection = .leftToRight,
            cornerRadius: CGFloat = 12,
            cornerMask: UIRectCorner = .allCorners,
            enableHighlightEffect: Bool = true,
            highlightAlpha: CGFloat = 0.15,
            highlightOverlayColor: UIColor = .black,
            highlightGradientColors: [UIColor]? = nil,
            highlightGradientDirection: GradientDirection = .leftToRight,
            enableClickAnimation: Bool = true,
            clickScale: CGFloat = 0.96,
            clickAnimationDuration: TimeInterval = 0.12,
            enableHaptics: Bool = false,
            hapticStyle: UIImpactFeedbackGenerator.FeedbackStyle = .light,
            hapticIntensityMode: HapticIntensityMode = .fixed,
            enableDebounce: Bool = false,
            debounceInterval: TimeInterval = 0.5,
            tapStrategy: TapStrategy = .none,
            imagePosition: ImagePosition = .left,
            imageTitleSpacing: CGFloat = 8,
            contentPadding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16),
            minimumHitSize: CGSize = CGSize(width: 44, height: 44),
            contentAlignment: UIControl.ContentHorizontalAlignment = .center,
            titleStyle: TitleStyle = .normal,
            loadingTitle: String? = nil,
            loadingIndicatorColor: UIColor = .white,
            shadowColor: UIColor? = nil,
            shadowOpacity: Float = 0,
            shadowRadius: CGFloat = 0,
            shadowOffset: CGSize = .zero,
            borderColor: UIColor? = nil,
            borderWidth: CGFloat = 0
        ) {
            self.gradientColors = gradientColors
            self.gradientDirection = gradientDirection
            self.cornerRadius = cornerRadius
            self.cornerMask = cornerMask
            self.enableHighlightEffect = enableHighlightEffect
            self.highlightAlpha = highlightAlpha
            self.highlightOverlayColor = highlightOverlayColor
            self.highlightGradientColors = highlightGradientColors
            self.highlightGradientDirection = highlightGradientDirection
            self.enableClickAnimation = enableClickAnimation
            self.clickScale = clickScale
            self.clickAnimationDuration = clickAnimationDuration
            self.enableHaptics = enableHaptics
            self.hapticStyle = hapticStyle
            self.hapticIntensityMode = hapticIntensityMode
            self.enableDebounce = enableDebounce
            self.debounceInterval = debounceInterval
            self.tapStrategy = tapStrategy
            self.imagePosition = imagePosition
            self.imageTitleSpacing = imageTitleSpacing
            self.contentPadding = contentPadding
            self.minimumHitSize = minimumHitSize
            self.contentAlignment = contentAlignment
            self.titleStyle = titleStyle
            self.loadingTitle = loadingTitle
            self.loadingIndicatorColor = loadingIndicatorColor
            self.shadowColor = shadowColor
            self.shadowOpacity = shadowOpacity
            self.shadowRadius = shadowRadius
            self.shadowOffset = shadowOffset
            self.borderColor = borderColor
            self.borderWidth = borderWidth
        }
    }
    
    public enum GradientDirection {
        case leftToRight
        case rightToLeft
        case topToBottom
        case bottomToTop
        case topLeftToBottomRight
        case bottomRightToTopLeft
        case topRightToBottomLeft
        case bottomLeftToTopRight
        
        var startPoint: CGPoint {
            switch self {
            case .leftToRight: return CGPoint(x: 0, y: 0.5)
            case .rightToLeft: return CGPoint(x: 1, y: 0.5)
            case .topToBottom: return CGPoint(x: 0.5, y: 0)
            case .bottomToTop: return CGPoint(x: 0.5, y: 1)
            case .topLeftToBottomRight: return CGPoint(x: 0, y: 0)
            case .bottomRightToTopLeft: return CGPoint(x: 1, y: 1)
            case .topRightToBottomLeft: return CGPoint(x: 1, y: 0)
            case .bottomLeftToTopRight: return CGPoint(x: 0, y: 1)
            }
        }
        
        var endPoint: CGPoint {
            switch self {
            case .leftToRight: return CGPoint(x: 1, y: 0.5)
            case .rightToLeft: return CGPoint(x: 0, y: 0.5)
            case .topToBottom: return CGPoint(x: 0.5, y: 1)
            case .bottomToTop: return CGPoint(x: 0.5, y: 0)
            case .topLeftToBottomRight: return CGPoint(x: 1, y: 1)
            case .bottomRightToTopLeft: return CGPoint(x: 0, y: 0)
            case .topRightToBottomLeft: return CGPoint(x: 0, y: 1)
            case .bottomLeftToTopRight: return CGPoint(x: 1, y: 0)
            }
        }
    }
    
    public var gradientColors: [UIColor] = [UIColor.systemBlue, UIColor.systemPurple] {
        didSet { updateGradientColors() }
    }
    
    public var gradientDirection: GradientDirection = .leftToRight {
        didSet { updateGradientDirection() }
    }
    
    public var cornerRadius: CGFloat = 12 {
        didSet { updateCornerMask() }
    }
    public var cornerMask: UIRectCorner = .allCorners {
        didSet { updateCornerMask() }
    }
    
    public var enableHighlightEffect: Bool = true
    public var highlightAlpha: CGFloat = 0.15
    public var highlightOverlayColor: UIColor = .black {
        didSet { updateHighlightOverlay() }
    }
    public var highlightGradientColors: [UIColor]? {
        didSet { updateHighlightOverlay() }
    }
    public var highlightGradientDirection: GradientDirection = .leftToRight {
        didSet { updateHighlightOverlay() }
    }
    
    public var enableClickAnimation: Bool = true
    public var clickScale: CGFloat = 0.96
    public var clickAnimationDuration: TimeInterval = 0.12
    
    public var enableHaptics: Bool = false
    public var hapticStyle: UIImpactFeedbackGenerator.FeedbackStyle = .light
    public var hapticIntensityMode: HapticIntensityMode = .fixed
    
    public var enableDebounce: Bool = false
    public var debounceInterval: TimeInterval = 0.5
    public var tapStrategy: TapStrategy = .none
    
    public var imagePosition: ImagePosition = .left {
        didSet { setNeedsLayout() }
    }
    public var imageTitleSpacing: CGFloat = 8 {
        didSet { setNeedsLayout() }
    }
    
    public var contentPadding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16) {
        didSet {
            contentEdgeInsets = contentPadding
            invalidateIntrinsicContentSize()
        }
    }
    public var minimumHitSize: CGSize = CGSize(width: 44, height: 44)
    public var titleStyle: TitleStyle = .normal {
        didSet { updateTitleStyle() }
    }
    public var enableDisabledAutoDim: Bool = true {
        didSet { applyDisabledAppearanceIfNeeded() }
    }
    public var disabledDimmedSaturation: CGFloat = 0.2
    public var disabledDimmedBrightness: CGFloat = 0.8
    public var disabledTitleAlpha: CGFloat = 0.6
    public var badgeText: String? {
        didSet { updateBadge() }
    }
    public var badgeBackgroundColor: UIColor = .systemRed {
        didSet { badgeLabel.backgroundColor = badgeBackgroundColor }
    }
    public var badgeTextColor: UIColor = .white {
        didSet { badgeLabel.textColor = badgeTextColor }
    }
    public var badgeFont: UIFont = .systemFont(ofSize: 11, weight: .semibold) {
        didSet { badgeLabel.font = badgeFont; updateBadge() }
    }
    public var badgeInsets: UIEdgeInsets = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 6) {
        didSet { updateBadge() }
    }
    public var badgeOffset: CGPoint = CGPoint(x: 8, y: -8) {
        didSet { updateBadge() }
    }
    
    public var isLoading: Bool = false {
        didSet { updateLoadingState() }
    }
    public var loadingTitle: String?
    public var loadingIndicatorColor: UIColor = .white {
        didSet { activityIndicator.color = loadingIndicatorColor }
    }
    
    public var shadowColor: UIColor? {
        didSet { updateShadow() }
    }
    public var shadowOpacity: Float = 0 {
        didSet { updateShadow() }
    }
    public var shadowRadius: CGFloat = 0 {
        didSet { updateShadow() }
    }
    public var shadowOffset: CGSize = .zero {
        didSet { updateShadow() }
    }
    
    public var borderColor: UIColor? {
        didSet { updateBorder() }
    }
    public var borderWidth: CGFloat = 0 {
        didSet { updateBorder() }
    }
    
    public var stateStyles: [UInt: Style] = [:]
    public var onTap: ((BlueCatButton) -> Void)?
    public var theme: Theme? {
        didSet { applyThemeIfNeeded() }
    }
    public var followSystemTheme: Bool = true {
        didSet { applyThemeIfNeeded() }
    }
    public var isShimmering: Bool = false {
        didSet { updateShimmerState() }
    }
    public var shimmerColors: [UIColor] = [
        UIColor.white.withAlphaComponent(0.2),
        UIColor.white.withAlphaComponent(0.6),
        UIColor.white.withAlphaComponent(0.2)
    ] {
        didSet { updateShimmerAppearance() }
    }
    public var shimmerDuration: TimeInterval = 1.6 {
        didSet { updateShimmerState() }
    }
    
    private let gradientLayer = CAGradientLayer()
    private let highlightOverlay = CAGradientLayer()
    private let shimmerLayer = CAGradientLayer()
    private let gradientTextLayer = CAGradientLayer()
    private let gradientTextMask = CATextLayer()
    private let badgeLabel = UILabel()
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    private var countdownTimer: Timer?
    private var remainingSeconds: Int = 0
    private var countdownSuffix: String = "s"
    private var countdownPrefix: String = ""
    private var countdownFormat: CountdownFormat = .seconds
    private var countdownCompletionTitle: String?
    private var countdownNormalTitle: String?
    private var onCountdownTick: ((Int) -> Void)?
    private var onCountdownCompletion: (() -> Void)?
    private var normalTitleForLoading: String?
    private var normalImageForLoading: UIImage?
    private var lastActionTimestamp: TimeInterval = 0
    private var pendingTapWorkItem: DispatchWorkItem?
    private var storedEnabledGradientColors: [UIColor]?
    private var storedEnabledTitleColor: UIColor?
    private var tapCount: Int = 0
    private var storedTitleColorForGradient: UIColor?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    deinit {
        countdownTimer?.invalidate()
    }
    
    private func commonInit() {
        layer.masksToBounds = false
        updateCornerMask()
        contentEdgeInsets = contentPadding
        contentHorizontalAlignment = .center
        
        gradientLayer.startPoint = gradientDirection.startPoint
        gradientLayer.endPoint = gradientDirection.endPoint
        updateGradientColors()
        layer.insertSublayer(gradientLayer, at: 0)
        
        highlightOverlay.opacity = 0
        updateHighlightOverlay()
        layer.insertSublayer(highlightOverlay, above: gradientLayer)
        
        updateShimmerAppearance()
        shimmerLayer.opacity = 0
        layer.insertSublayer(shimmerLayer, above: highlightOverlay)
        
        gradientTextLayer.mask = gradientTextMask
        gradientTextLayer.isHidden = true
        layer.addSublayer(gradientTextLayer)
        
        badgeLabel.font = badgeFont
        badgeLabel.textColor = badgeTextColor
        badgeLabel.backgroundColor = badgeBackgroundColor
        badgeLabel.textAlignment = .center
        badgeLabel.clipsToBounds = true
        badgeLabel.isHidden = true
        addSubview(badgeLabel)
        
        setTitleColor(.white, for: .normal)
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = loadingIndicatorColor
        addSubview(activityIndicator)
        
        addTarget(self, action: #selector(handleTouchDown), for: .touchDown)
        addTarget(self, action: #selector(handleTouchUp), for: [.touchUpInside, .touchCancel, .touchDragExit])
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        highlightOverlay.frame = bounds
        shimmerLayer.frame = bounds
        updateCornerMask()
        activityIndicator.center = CGPoint(x: bounds.midX, y: bounds.midY)
        updateImageLayoutIfNeeded()
        updateTitleStyleLayout()
        updateBadgeLayout()
    }
    
    public override var intrinsicContentSize: CGSize {
        sizeThatFits(.zero)
    }
    
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        let titleSize = titleLabel?.intrinsicContentSize ?? .zero
        let imageSize = imageView?.intrinsicContentSize ?? .zero
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        if titleSize != .zero && imageSize != .zero {
            switch imagePosition {
            case .left, .right:
                width = imageSize.width + imageTitleSpacing + titleSize.width
                height = max(imageSize.height, titleSize.height)
            case .top, .bottom:
                width = max(imageSize.width, titleSize.width)
                height = imageSize.height + imageTitleSpacing + titleSize.height
            }
        } else {
            width = max(titleSize.width, imageSize.width)
            height = max(titleSize.height, imageSize.height)
        }
        
        width += contentPadding.left + contentPadding.right
        height += contentPadding.top + contentPadding.bottom
        return CGSize(width: width, height: height)
    }
    
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let widthDelta = max(minimumHitSize.width - bounds.width, 0) / 2
        let heightDelta = max(minimumHitSize.height - bounds.height, 0) / 2
        let hitBounds = bounds.insetBy(dx: -widthDelta, dy: -heightDelta)
        return hitBounds.contains(point)
    }
    
    public override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if enableHaptics {
            tapCount += 1
            let generator = UIImpactFeedbackGenerator(style: hapticStyle)
            generator.prepare()
            switch hapticIntensityMode {
            case .fixed:
                if #available(iOS 13.0, *) {
                    generator.impactOccurred(intensity: 0.7)
                } else {
                    generator.impactOccurred()
                }
            case .byTapCount:
                let intensity = min(1.0, 0.3 + 0.1 * CGFloat(tapCount % 6))
                if #available(iOS 13.0, *) {
                    generator.impactOccurred(intensity: intensity)
                } else {
                    generator.impactOccurred()
                }
            case .byForce:
                let force = touch.maximumPossibleForce > 0 ? (touch.force / touch.maximumPossibleForce) : 0
                let intensity = min(1.0, max(0.2, force))
                if #available(iOS 13.0, *) {
                    generator.impactOccurred(intensity: intensity)
                } else {
                    generator.impactOccurred()
                }
            }
        }
        return super.beginTracking(touch, with: event)
    }
    
    public override var isHighlighted: Bool {
        didSet {
            guard enableHighlightEffect else { return }
            highlightOverlay.opacity = isHighlighted ? Float(highlightAlpha) : 0
            applyCurrentStateStyleIfNeeded()
        }
    }
    
    public override var isSelected: Bool {
        didSet {
            applyCurrentStateStyleIfNeeded()
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            applyCurrentStateStyleIfNeeded()
            applyDisabledAppearanceIfNeeded()
        }
    }
    
    public override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        switch tapStrategy {
        case .none:
            if enableDebounce {
                let now = CACurrentMediaTime()
                if now - lastActionTimestamp < debounceInterval {
                    return
                }
                lastActionTimestamp = now
            }
            performSendAction(action, to: target, for: event)
        case .throttle(let interval):
            let now = CACurrentMediaTime()
            if now - lastActionTimestamp < interval {
                return
            }
            lastActionTimestamp = now
            performSendAction(action, to: target, for: event)
        case .debounce(let interval):
            pendingTapWorkItem?.cancel()
            let workItem = DispatchWorkItem { [weak self] in
                self?.performSendAction(action, to: target, for: event)
            }
            pendingTapWorkItem = workItem
            DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: workItem)
        }
    }
    
    public func setGradient(colors: [UIColor], direction: GradientDirection) {
        gradientColors = colors
        gradientDirection = direction
    }
    
    public func applyStyle(_ style: Style) {
        gradientColors = style.gradientColors
        gradientDirection = style.gradientDirection
        cornerRadius = style.cornerRadius
        cornerMask = style.cornerMask
        enableHighlightEffect = style.enableHighlightEffect
        highlightAlpha = style.highlightAlpha
        highlightOverlayColor = style.highlightOverlayColor
        highlightGradientColors = style.highlightGradientColors
        highlightGradientDirection = style.highlightGradientDirection
        enableClickAnimation = style.enableClickAnimation
        clickScale = style.clickScale
        clickAnimationDuration = style.clickAnimationDuration
        enableHaptics = style.enableHaptics
        hapticStyle = style.hapticStyle
        hapticIntensityMode = style.hapticIntensityMode
        enableDebounce = style.enableDebounce
        debounceInterval = style.debounceInterval
        tapStrategy = style.tapStrategy
        imagePosition = style.imagePosition
        imageTitleSpacing = style.imageTitleSpacing
        contentPadding = style.contentPadding
        minimumHitSize = style.minimumHitSize
        setContentAlignment(style.contentAlignment)
        titleStyle = style.titleStyle
        loadingTitle = style.loadingTitle
        loadingIndicatorColor = style.loadingIndicatorColor
        shadowColor = style.shadowColor
        shadowOpacity = style.shadowOpacity
        shadowRadius = style.shadowRadius
        shadowOffset = style.shadowOffset
        borderColor = style.borderColor
        borderWidth = style.borderWidth
        applyDisabledAppearanceIfNeeded()
    }
    
    private func performSendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        super.sendAction(action, to: target, for: event)
    }
    
    public func setStyle(_ style: Style, for state: UIControl.State) {
        stateStyles[state.rawValue] = style
        applyCurrentStateStyleIfNeeded()
    }
    
    public func setContentAlignment(_ alignment: UIControl.ContentHorizontalAlignment) {
        contentHorizontalAlignment = alignment
    }
    
    @MainActor
    public func performLoadingTask(_ task: @escaping () async -> Void) {
        isLoading = true
        Task { [weak self] in
            await task()
            await MainActor.run {
                self?.isLoading = false
            }
        }
    }
    
    public func style(for state: UIControl.State) -> Style? {
        stateStyles[state.rawValue]
    }
    
    public func applyTheme(_ theme: Theme, followSystem: Bool = true) {
        self.theme = theme
        self.followSystemTheme = followSystem
        applyThemeIfNeeded()
    }
    
    public static func theme(for preset: ThemePreset) -> Theme {
        switch preset {
        case .primary:
            return Theme(
                light: Style(gradientColors: [UIColor.systemBlue, UIColor.systemPurple]),
                dark: Style(gradientColors: [UIColor.systemTeal, UIColor.systemBlue])
            )
        case .success:
            return Theme(
                light: Style(gradientColors: [UIColor.systemGreen, UIColor.systemTeal]),
                dark: Style(gradientColors: [UIColor.systemGreen, UIColor.systemBlue])
            )
        case .warning:
            return Theme(
                light: Style(gradientColors: [UIColor.systemOrange, UIColor.systemYellow]),
                dark: Style(gradientColors: [UIColor.systemOrange, UIColor.systemRed])
            )
        case .danger:
            return Theme(
                light: Style(gradientColors: [UIColor.systemRed, UIColor.systemPink]),
                dark: Style(gradientColors: [UIColor.systemRed, UIColor.systemPurple])
            )
        case .neutral:
            return Theme(
                light: Style(gradientColors: [UIColor.systemGray4, UIColor.systemGray2]),
                dark: Style(gradientColors: [UIColor.systemGray, UIColor.systemGray2])
            )
        }
    }
    
    private func applyCurrentStateStyleIfNeeded() {
        let state = currentVisualState()
        if let style = stateStyles[state.rawValue] {
            applyStyle(style)
            return
        }
        if state != .normal, let normalStyle = stateStyles[UIControl.State.normal.rawValue] {
            applyStyle(normalStyle)
        }
    }
    
    private func applyThemeIfNeeded() {
        guard let theme else { return }
        let useDark = followSystemTheme && traitCollection.userInterfaceStyle == .dark
        applyStyle(useDark ? theme.dark : theme.light)
        applyDisabledAppearanceIfNeeded()
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.userInterfaceStyle != traitCollection.userInterfaceStyle {
            applyThemeIfNeeded()
        }
    }
    
    public func startGradientColorAnimation(
        colors: [[UIColor]],
        duration: TimeInterval = 2.5,
        autoreverses: Bool = true,
        repeatCount: Float = .infinity
    ) {
        let cgColors = colors.map { $0.map { $0.cgColor } }
        guard cgColors.count > 1 else { return }
        let animation = CAKeyframeAnimation(keyPath: "colors")
        animation.values = cgColors
        animation.duration = duration
        animation.autoreverses = autoreverses
        animation.repeatCount = repeatCount
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        gradientLayer.add(animation, forKey: "gradientColorsAnimation")
    }
    
    public func startGradientFlowAnimation(
        duration: TimeInterval = 2.5,
        repeatCount: Float = .infinity,
        direction: GradientDirection? = nil
    ) {
        if let direction {
            gradientDirection = direction
        }
        let count = max(2, gradientColors.count)
        let step = 1.0 / Double(count - 1)
        let startLocations = (0..<count).map { NSNumber(value: Double($0) * step) }
        let endLocations = (0..<count).map { NSNumber(value: Double($0) * step + 1.0) }
        gradientLayer.locations = startLocations
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = startLocations
        animation.toValue = endLocations
        animation.duration = duration
        animation.repeatCount = repeatCount
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        gradientLayer.add(animation, forKey: "gradientFlowAnimation")
    }
    
    public func startGradientDirectionAnimation(
        directions: [GradientDirection],
        duration: TimeInterval = 2.5,
        autoreverses: Bool = true,
        repeatCount: Float = .infinity
    ) {
        guard directions.count > 1 else { return }
        let startPoints = directions.map { $0.startPoint }
        let endPoints = directions.map { $0.endPoint }
        let startAnimation = CAKeyframeAnimation(keyPath: "startPoint")
        startAnimation.values = startPoints
        startAnimation.duration = duration
        startAnimation.autoreverses = autoreverses
        startAnimation.repeatCount = repeatCount
        startAnimation.isRemovedOnCompletion = false
        startAnimation.fillMode = .forwards
        let endAnimation = CAKeyframeAnimation(keyPath: "endPoint")
        endAnimation.values = endPoints
        endAnimation.duration = duration
        endAnimation.autoreverses = autoreverses
        endAnimation.repeatCount = repeatCount
        endAnimation.isRemovedOnCompletion = false
        endAnimation.fillMode = .forwards
        gradientLayer.add(startAnimation, forKey: "gradientStartPointAnimation")
        gradientLayer.add(endAnimation, forKey: "gradientEndPointAnimation")
    }
    
    public func stopGradientAnimation() {
        gradientLayer.removeAnimation(forKey: "gradientColorsAnimation")
        gradientLayer.removeAnimation(forKey: "gradientStartPointAnimation")
        gradientLayer.removeAnimation(forKey: "gradientEndPointAnimation")
        gradientLayer.removeAnimation(forKey: "gradientFlowAnimation")
    }
    
    public func startCountdown(
        seconds: Int,
        suffix: String = "s",
        prefix: String = "",
        format: CountdownFormat = .seconds,
        completionTitle: String? = nil,
        normalTitle: String? = nil,
        onTick: ((Int) -> Void)? = nil,
        onCompletion: (() -> Void)? = nil
    ) {
        countdownTimer?.invalidate()
        remainingSeconds = max(0, seconds)
        countdownSuffix = suffix
        countdownPrefix = prefix
        countdownFormat = format
        countdownCompletionTitle = completionTitle
        countdownNormalTitle = normalTitle ?? title(for: .normal)
        onCountdownTick = onTick
        onCountdownCompletion = onCompletion
        
        isEnabled = false
        updateCountdownTitle()
        
        guard remainingSeconds > 0 else {
            finishCountdown()
            return
        }
        
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            guard let self else { return }
            self.remainingSeconds -= 1
            if self.remainingSeconds <= 0 {
                self.finishCountdown()
            } else {
                self.updateCountdownTitle()
                self.onCountdownTick?(self.remainingSeconds)
            }
        })
        RunLoop.main.add(countdownTimer!, forMode: .common)
    }
    
    public func stopCountdown() {
        finishCountdown()
    }
    
    private func updateCountdownTitle() {
        setTitle(formattedCountdownText(), for: .disabled)
    }
    
    private func finishCountdown() {
        countdownTimer?.invalidate()
        countdownTimer = nil
        remainingSeconds = 0
        isEnabled = true
        let finalTitle = countdownCompletionTitle ?? countdownNormalTitle
        if let finalTitle {
            setTitle(finalTitle, for: .normal)
        }
        onCountdownCompletion?()
    }
    
    private func updateGradientColors() {
        gradientLayer.colors = gradientColors.map { $0.cgColor }
    }
    
    private func updateGradientDirection() {
        gradientLayer.startPoint = gradientDirection.startPoint
        gradientLayer.endPoint = gradientDirection.endPoint
    }
    
    private func updateTitleStyle() {
        switch titleStyle {
        case .normal:
            gradientTextLayer.isHidden = true
            gradientTextLayer.mask = nil
            titleLabel?.isHidden = false
            if let storedTitleColorForGradient {
                setTitleColor(storedTitleColorForGradient, for: .normal)
                self.storedTitleColorForGradient = nil
            }
            if let title = title(for: .normal) {
                setAttributedTitle(nil, for: .normal)
                setTitle(title, for: .normal)
            }
        case .gradient:
            gradientTextLayer.isHidden = false
            gradientTextLayer.mask = gradientTextMask
            titleLabel?.isHidden = false
            if storedTitleColorForGradient == nil {
                storedTitleColorForGradient = titleColor(for: .normal)
            }
            setTitleColor(.clear, for: .normal)
        case .stroke(let color, let width):
            gradientTextLayer.isHidden = true
            if let storedTitleColorForGradient {
                setTitleColor(storedTitleColorForGradient, for: .normal)
                self.storedTitleColorForGradient = nil
            }
            let title = title(for: .normal) ?? ""
            let font = titleLabel?.font ?? UIFont.systemFont(ofSize: 16, weight: .semibold)
            let attributes: [NSAttributedString.Key: Any] = [
                .strokeColor: color,
                .foregroundColor: color,
                .strokeWidth: -abs(width),
                .font: font
            ]
            setAttributedTitle(NSAttributedString(string: title, attributes: attributes), for: .normal)
        }
        setNeedsLayout()
    }
    
    private func updateTitleStyleLayout() {
        switch titleStyle {
        case .normal:
            return
        case .stroke:
            return
        case .gradient(let colors, let direction):
            guard let titleLabel, let text = titleLabel.text, !text.isEmpty else { return }
            gradientTextLayer.frame = titleLabel.frame
            gradientTextLayer.colors = colors.map { $0.cgColor }
            gradientTextLayer.startPoint = direction.startPoint
            gradientTextLayer.endPoint = direction.endPoint
            gradientTextMask.frame = titleLabel.bounds
            gradientTextMask.string = text
            gradientTextMask.alignmentMode = .center
            gradientTextMask.contentsScale = UIScreen.main.scale
            gradientTextMask.font = titleLabel.font
            gradientTextMask.fontSize = titleLabel.font.pointSize
            gradientTextLayer.mask = gradientTextMask
        }
    }
    
    private func updateBadge() {
        let text = badgeText?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        if text.isEmpty {
            badgeLabel.isHidden = true
            return
        }
        badgeLabel.isHidden = false
        badgeLabel.text = text
        updateBadgeLayout()
    }
    
    private func updateBadgeLayout() {
        guard !badgeLabel.isHidden else { return }
        let labelSize = badgeLabel.intrinsicContentSize
        let width = labelSize.width + badgeInsets.left + badgeInsets.right
        let height = labelSize.height + badgeInsets.top + badgeInsets.bottom
        let badgeSize = CGSize(width: max(width, height), height: height)
        let originX = bounds.maxX - badgeSize.width / 2 + badgeOffset.x
        let originY = bounds.minY - badgeSize.height / 2 + badgeOffset.y
        badgeLabel.frame = CGRect(origin: CGPoint(x: originX, y: originY), size: badgeSize)
        badgeLabel.layer.cornerRadius = badgeSize.height / 2
    }
    
    private func updateHighlightOverlay() {
        if let highlightGradientColors, !highlightGradientColors.isEmpty {
            highlightOverlay.colors = highlightGradientColors.map { $0.cgColor }
            highlightOverlay.startPoint = highlightGradientDirection.startPoint
            highlightOverlay.endPoint = highlightGradientDirection.endPoint
        } else {
            highlightOverlay.colors = [highlightOverlayColor.cgColor, highlightOverlayColor.cgColor]
            highlightOverlay.startPoint = CGPoint(x: 0, y: 0.5)
            highlightOverlay.endPoint = CGPoint(x: 1, y: 0.5)
        }
    }
    
    private func updateShimmerAppearance() {
        shimmerLayer.colors = shimmerColors.map { $0.cgColor }
        shimmerLayer.startPoint = CGPoint(x: 0, y: 0.5)
        shimmerLayer.endPoint = CGPoint(x: 1, y: 0.5)
        shimmerLayer.locations = [-1, -0.5, 0]
    }
    
    private func updateShimmerState() {
        shimmerLayer.removeAnimation(forKey: "shimmerLocationsAnimation")
        if isShimmering {
            shimmerLayer.opacity = 1
            let animation = CABasicAnimation(keyPath: "locations")
            animation.fromValue = [-1, -0.5, 0]
            animation.toValue = [1, 1.5, 2]
            animation.duration = shimmerDuration
            animation.repeatCount = .infinity
            animation.isRemovedOnCompletion = false
            shimmerLayer.add(animation, forKey: "shimmerLocationsAnimation")
        } else {
            shimmerLayer.opacity = 0
        }
    }
    
    private func updateCornerMask() {
        let radius = cornerRadius
        layer.cornerRadius = radius
        gradientLayer.cornerRadius = radius
        highlightOverlay.cornerRadius = radius
        shimmerLayer.cornerRadius = radius
        gradientTextLayer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            let maskedCorners = cornerMask.toMaskedCorners()
            layer.maskedCorners = maskedCorners
            gradientLayer.maskedCorners = maskedCorners
            highlightOverlay.maskedCorners = maskedCorners
            shimmerLayer.maskedCorners = maskedCorners
            gradientTextLayer.maskedCorners = maskedCorners
        }
    }
    
    private func applyDisabledAppearanceIfNeeded() {
        guard enableDisabledAutoDim else { return }
        if !isEnabled {
            if stateStyles[UIControl.State.disabled.rawValue] != nil { return }
            if storedEnabledGradientColors == nil {
                storedEnabledGradientColors = gradientColors
            }
            if storedEnabledTitleColor == nil {
                storedEnabledTitleColor = titleColor(for: .normal)
            }
            let dimmed = gradientColors.map { dimmedColor($0) }
            gradientColors = dimmed
            if let storedEnabledTitleColor {
                setTitleColor(storedEnabledTitleColor.withAlphaComponent(disabledTitleAlpha), for: .normal)
            }
        } else {
            if let storedEnabledGradientColors {
                gradientColors = storedEnabledGradientColors
                self.storedEnabledGradientColors = nil
            }
            if let storedEnabledTitleColor {
                setTitleColor(storedEnabledTitleColor, for: .normal)
                self.storedEnabledTitleColor = nil
            }
        }
    }
    
    private func dimmedColor(_ color: UIColor) -> UIColor {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        if color.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            return UIColor(hue: h, saturation: s * disabledDimmedSaturation, brightness: b * disabledDimmedBrightness, alpha: a)
        }
        return color.withAlphaComponent(disabledTitleAlpha)
    }
    
    private func updateShadow() {
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.masksToBounds = false
    }
    
    private func updateBorder() {
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
    }
    
    private func formattedCountdownText() -> String {
        switch countdownFormat {
        case .seconds:
            return "\(countdownPrefix)\(remainingSeconds)\(countdownSuffix)"
        case .minutesSeconds:
            let minutes = max(0, remainingSeconds) / 60
            let seconds = max(0, remainingSeconds) % 60
            return String(format: "\(countdownPrefix)%02d:%02d\(countdownSuffix)", minutes, seconds)
        }
    }
    
    private func updateLoadingState() {
        if isLoading {
            normalTitleForLoading = title(for: .normal)
            normalImageForLoading = image(for: .normal)
            isEnabled = false
            setTitle(loadingTitle ?? normalTitleForLoading, for: .normal)
            setImage(nil, for: .normal)
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            isEnabled = true
            if let normalTitleForLoading {
                setTitle(normalTitleForLoading, for: .normal)
            }
            if let normalImageForLoading {
                setImage(normalImageForLoading, for: .normal)
            }
        }
        setNeedsLayout()
    }
    
    private func updateImageLayoutIfNeeded() {
        guard let imageView, let titleLabel, image(for: .normal) != nil, let titleText = titleLabel.text, !titleText.isEmpty else {
            return
        }
        if imagePosition == .left {
            semanticContentAttribute = .unspecified
            return
        }
        
        let contentRect = bounds.inset(by: contentEdgeInsets)
        let imageSize = imageView.image?.size ?? imageView.bounds.size
        let titleSize = titleLabel.sizeThatFits(contentRect.size)
        
        switch imagePosition {
        case .right:
            semanticContentAttribute = .forceRightToLeft
            imageEdgeInsets = UIEdgeInsets(top: 0, left: imageTitleSpacing, bottom: 0, right: -imageTitleSpacing)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageTitleSpacing, bottom: 0, right: imageTitleSpacing)
        case .top, .bottom:
            semanticContentAttribute = .unspecified
            let totalHeight = imageSize.height + imageTitleSpacing + titleSize.height
            let imageX = contentRect.midX - imageSize.width / 2
            let titleX = contentRect.midX - titleSize.width / 2
            if imagePosition == .top {
                imageView.frame = CGRect(
                    x: imageX,
                    y: contentRect.midY - totalHeight / 2,
                    width: imageSize.width,
                    height: imageSize.height
                )
                titleLabel.frame = CGRect(
                    x: titleX,
                    y: imageView.frame.maxY + imageTitleSpacing,
                    width: titleSize.width,
                    height: titleSize.height
                )
            } else {
                titleLabel.frame = CGRect(
                    x: titleX,
                    y: contentRect.midY - totalHeight / 2,
                    width: titleSize.width,
                    height: titleSize.height
                )
                imageView.frame = CGRect(
                    x: imageX,
                    y: titleLabel.frame.maxY + imageTitleSpacing,
                    width: imageSize.width,
                    height: imageSize.height
                )
            }
        default:
            break
        }
    }
    
    private func currentVisualState() -> UIControl.State {
        if !isEnabled { return .disabled }
        if isHighlighted { return .highlighted }
        if isSelected { return .selected }
        return .normal
    }
    
    @objc private func handleTouchDown() {
        guard enableClickAnimation else { return }
        UIView.animate(withDuration: clickAnimationDuration, delay: 0, options: [.curveEaseOut, .allowUserInteraction]) {
            self.transform = CGAffineTransform(scaleX: self.clickScale, y: self.clickScale)
        }
    }
    
    @objc private func handleTouchUp() {
        guard enableClickAnimation else { return }
        UIView.animate(withDuration: clickAnimationDuration, delay: 0, options: [.curveEaseIn, .allowUserInteraction]) {
            self.transform = .identity
        }
    }
    
    @objc private func handleTap() {
        onTap?(self)
    }
}

private extension UIRectCorner {
    func toMaskedCorners() -> CACornerMask {
        var mask: CACornerMask = []
        if contains(.topLeft) { mask.insert(.layerMinXMinYCorner) }
        if contains(.topRight) { mask.insert(.layerMaxXMinYCorner) }
        if contains(.bottomLeft) { mask.insert(.layerMinXMaxYCorner) }
        if contains(.bottomRight) { mask.insert(.layerMaxXMaxYCorner) }
        return mask
    }
}

