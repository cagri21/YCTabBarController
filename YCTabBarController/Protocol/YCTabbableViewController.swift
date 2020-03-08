//
//  YCTabbableViewController.swift
//  YCTabBarController
//
//  Created by Çağrı Yörükoğlu on 8.03.2020.
//  Copyright © 2020 Çağrı Yörükoğlu. All rights reserved.
//

import UIKit

public typealias YCTabbableViewController = YCTabBarViewController & UIViewController

public protocol YCTabBarViewController {
    func ycTabBarItem() -> UITabBarItem
}
