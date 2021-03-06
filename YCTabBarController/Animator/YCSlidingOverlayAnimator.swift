//
//  YCSlidingOverlayAnimator.swift
//  YCTabBarController
//
//  Created by Çağrı Yörükoğlu on 8.03.2020.
//  Copyright © 2020 Çağrı Yörükoğlu. All rights reserved.
//

import UIKit

public class YCSlidingOverlayAnimator: YCTabBarAnimatable {
    
    private var tabColors: [UIColor]!
    private var rightOverlayView: UIView = UIView(frame: .zero)
    private var leftOverlayView: UIView = UIView(frame: .zero)
    private var containerWidth: CGFloat = 0
    private var numberOfContainers: Int = 0
    
    private var rightOverlayXPosition: CGFloat = 0 {
        didSet {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
                self.rightOverlayView.frame.origin.x = self.rightOverlayXPosition
            })
        }
    }
    private var leftOverlayXPosition: CGFloat = 0 {
        didSet {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
                self.leftOverlayView.frame.origin.x = self.leftOverlayXPosition
            })
        }
    }
    private let zoomAnimator = YCZoomAnimator()
    
    public init(withTabBarColors tabColors: [UIColor]){
        self.tabColors = tabColors
        print(tabColors)
    }
    
    public func prepareForAnimation(onYCTabBar tabBar: UIView,
                                    withContainers containers: [YCTabBarContainer],
                                    andInitialIndex initialIndex: Int) {
        
        let tabColorCount = tabColors.count
        print(tabColorCount)
        if containers.count != tabColors.count {
            fatalError("Please provide colors for all tab items. TabItems = \(containers.count) : Colors = \(tabColors.count)")
        }
        
        numberOfContainers = containers.count
        containerWidth = CGFloat(tabBar.frame.width / CGFloat(numberOfContainers))
        
        rightOverlayXPosition = CGFloat(containerWidth*CGFloat(initialIndex)) + containerWidth
        rightOverlayView = UIView(frame: CGRect(x: rightOverlayXPosition,
                                                y: 0,
                                                width: tabBar.frame.width,
                                                height: tabBar.frame.height))
        rightOverlayView.backgroundColor = tabBar.backgroundColor
        
        leftOverlayXPosition = CGFloat(-tabBar.frame.width) + rightOverlayXPosition - containerWidth
        leftOverlayView = UIView(frame: CGRect(x: leftOverlayXPosition,
                                               y: 0,
                                               width: tabBar.frame.width,
                                               height: tabBar.frame.height))
        leftOverlayView.backgroundColor = tabBar.backgroundColor
        
        
        tabBar.addSubview(rightOverlayView)
        tabBar.addSubview(leftOverlayView)
        tabBar.sendSubviewToBack(rightOverlayView)
        tabBar.sendSubviewToBack(leftOverlayView)
        
        let colorContainers = self.createOverlayContainers(forContainers: containers, withColors: tabColors)
        
        for container in colorContainers {
            tabBar.addSubview(container)
            tabBar.sendSubviewToBack(container)
        }
        
        zoomAnimator.prepareForAnimation(onYCTabBar: tabBar, withContainers: containers, andInitialIndex: initialIndex)
    }
    
    public func performAnimation(fromIndex: Int,
                                 toIndex: Int,
                                 onYCTabBar tabBar: UIView,
                                 withContainers containers: [YCTabBarContainer],
                                 completion: @escaping () -> Void) {
        
        rightOverlayXPosition = CGFloat(containerWidth*CGFloat(toIndex)) + containerWidth
        leftOverlayXPosition = CGFloat(-tabBar.frame.width) + rightOverlayXPosition - containerWidth
        
        zoomAnimator.performAnimation(fromIndex: fromIndex, toIndex: toIndex, onYCTabBar: tabBar, withContainers: containers, completion: {
            completion()
        })
        
    }
    
    private func createOverlayContainers(forContainers containers: [YCTabBarContainer], withColors colors: [UIColor]) -> [UIView] {
        
        var views = [UIView]()
        
        for (index, container) in containers.enumerated() {
            let rect = CGRect(x: CGFloat(index)*containerWidth,
                              y: 0,
                              width: containerWidth,
                              height: container.frame.height)
            let view = UIView(frame: rect)
            view.backgroundColor = colors[index]
            views.append(view)
        }
        
        return views
    }
}

