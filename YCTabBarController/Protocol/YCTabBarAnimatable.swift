//
//  YCTabBarAnimatable.swift
//  YCTabBarController
//
//  Created by Çağrı Yörükoğlu on 8.03.2020.
//  Copyright © 2020 Çağrı Yörükoğlu. All rights reserved.
//
import UIKit

public protocol YCTabBarAnimatable {
    func prepareForAnimation(onMDVTabBar tabBar: UIView,
                             withContainers containers: [YCTabBarContainer],
                             andInitialIndex initialIndex:Int)
    func performAnimation(fromIndex:Int,
                          toIndex:Int,
                          onMDVTabBar tabBar: UIView,
                          withContainers containers: [YCTabBarContainer],
                          completion: @escaping () -> Void)
}


