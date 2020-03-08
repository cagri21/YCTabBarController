//
//  YCTabBarItemable.swift
//  YCTabBarController
//
//  Created by Çağrı Yörükoğlu on 8.03.2020.
//  Copyright © 2020 Çağrı Yörükoğlu. All rights reserved.
//

import UIKit

public typealias YCTabBarContainer = UIView & YCTabBarItemable

public protocol YCTabBarItemable {
    func configure(withtabBarItem item: UITabBarItem)
    func setState(isSelected: Bool)
}
