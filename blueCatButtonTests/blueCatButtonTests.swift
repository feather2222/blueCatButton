//
//  blueCatButtonTests.swift
//  blueCatButtonTests
//
//  Created by xiangduojia on 2026/2/16.
//

import XCTest
import UIKit
@testable import blueCatButton

final class blueCatButtonTests: XCTestCase {
    func testApplyStyleUpdatesProperties() {
        let button = BlueCatButton()
        let style = BlueCatButton.Style(
            gradientColors: [UIColor.red, UIColor.blue],
            gradientDirection: .topToBottom,
            cornerRadius: 10,
            cornerMask: [.topLeft, .bottomRight],
            enableHighlightEffect: false,
            highlightAlpha: 0.2,
            highlightOverlayColor: .black,
            highlightGradientColors: nil,
            highlightGradientDirection: .leftToRight,
            enableClickAnimation: false,
            clickScale: 0.9,
            clickAnimationDuration: 0.2,
            enableHaptics: true,
            hapticStyle: .heavy,
            hapticIntensityMode: .byTapCount,
            enableDebounce: true,
            debounceInterval: 0.3,
            tapStrategy: .throttle(0.5),
            imagePosition: .right,
            imageTitleSpacing: 12,
            contentPadding: UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12),
            minimumHitSize: CGSize(width: 44, height: 44),
            contentAlignment: .left,
            titleStyle: .normal,
            loadingTitle: "加载中",
            loadingIndicatorColor: .white,
            shadowColor: .black,
            shadowOpacity: 0.1,
            shadowRadius: 4,
            shadowOffset: CGSize(width: 0, height: 2),
            borderColor: .white,
            borderWidth: 1
        )

        button.applyStyle(style)

        XCTAssertEqual(button.gradientDirection, .topToBottom)
        XCTAssertEqual(button.cornerRadius, 10)
        XCTAssertEqual(button.cornerMask, [.topLeft, .bottomRight])
        XCTAssertFalse(button.enableHighlightEffect)
        XCTAssertEqual(button.highlightAlpha, 0.2)
        XCTAssertFalse(button.enableClickAnimation)
        XCTAssertEqual(button.clickScale, 0.9)
        XCTAssertEqual(button.clickAnimationDuration, 0.2)
        XCTAssertTrue(button.enableHaptics)
        XCTAssertEqual(button.hapticStyle, .heavy)
        XCTAssertEqual(button.hapticIntensityMode, .byTapCount)
        XCTAssertTrue(button.enableDebounce)
        XCTAssertEqual(button.debounceInterval, 0.3)
        XCTAssertEqual(button.imagePosition, .right)
        XCTAssertEqual(button.imageTitleSpacing, 12)
        XCTAssertEqual(button.contentPadding, UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
        XCTAssertEqual(button.minimumHitSize, CGSize(width: 44, height: 44))
        XCTAssertEqual(button.contentHorizontalAlignment, .left)
        XCTAssertEqual(button.loadingTitle, "加载中")
        XCTAssertEqual(button.loadingIndicatorColor, .white)
        XCTAssertEqual(button.shadowOpacity, 0.1)
        XCTAssertEqual(button.shadowRadius, 4)
        XCTAssertEqual(button.shadowOffset, CGSize(width: 0, height: 2))
        XCTAssertEqual(button.borderWidth, 1)
    }

    func testThemePresetApplies() {
        let button = BlueCatButton()
        let theme = BlueCatButton.theme(for: .success)
        button.applyTheme(theme, followSystem: false)
        XCTAssertEqual(button.gradientColors.count, 2)
    }

    func testTapStrategyDebounce() {
        let button = BlueCatButton()
        button.tapStrategy = .debounce(0.2)
        let expectation = expectation(description: "debounce")
        var count = 0
        button.onTap = { _ in
            count += 1
            expectation.fulfill()
        }

        button.sendActions(for: .touchUpInside)
        button.sendActions(for: .touchUpInside)

        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(count, 1)
    }

    func testTitleStyleStroke() {
        let button = BlueCatButton()
        button.setTitle("Test", for: .normal)
        button.titleStyle = .stroke(color: .white, width: 2)
        XCTAssertNotNil(button.attributedTitle(for: .normal))
    }

    func testBadgeVisibility() {
        let button = BlueCatButton()
        button.badgeText = "9+"
        button.layoutIfNeeded()
        XCTAssertNotNil(button.badgeText)
    }

    func testLoadingTaskEndsLoading() async {
        let button = BlueCatButton()
        await button.performLoadingTask {
            try? await Task.sleep(nanoseconds: 50_000_000)
        }
        XCTAssertFalse(button.isLoading)
    }
}
