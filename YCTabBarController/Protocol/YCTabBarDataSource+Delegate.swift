//
//  YCTabBarDataSource+Delegate.swift
//  YCTabBarController
//
//  Created by Çağrı Yörükoğlu on 8.03.2020.
//  Copyright © 2020 Çağrı Yörükoğlu. All rights reserved.
//

import UIKit

protocol YCTabBarDelegate: class {
    func didSelect(tabAtIndex index: Int)
}

protocol YCTabBarDataSource: class {
    func ycTabBarItems() -> [UITabBarItem]
    func setAnimationStyle() -> YCAnimationStyle?
    func animationColors() -> [UIColor]?
    func backgroundColorsUnderline()->YCUnderlineAnimator
}

