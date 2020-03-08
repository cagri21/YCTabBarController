//
//  YCTabBarControllerDataSource+Delegate.swift
//  YCTabBarController
//
//  Created by Çağrı Yörükoğlu on 8.03.2020.
//  Copyright © 2020 Çağrı Yörükoğlu. All rights reserved.
//

import UIKit

public protocol YCTabBarControllerDataSource: class {
    func tabBarControllerInitialIndex() -> Int
    func tabBarControllerViewControllers() -> [YCTabbableViewController]
    func tabBarHeight() -> CGFloat
    func tabBarBackgroundColor() -> UIColor
    func tabBarAnimator() -> YCTabBarAnimatable
    func chooseTabBarAnimator()->AnimationStyle
}

public protocol YCTabBarControllerDelegate: class {
    func tabBar(_ tabBarController: YCTabBarController, didSelectIndex index: Int)
}
