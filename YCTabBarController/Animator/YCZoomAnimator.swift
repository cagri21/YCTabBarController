//
//  YCZoomAnimator.swift
//  YCTabBarController
//
//  Created by Çağrı Yörükoğlu on 8.03.2020.
//  Copyright © 2020 Çağrı Yörükoğlu. All rights reserved.
//
import UIKit

public class YCZoomAnimator: YCTabBarAnimatable {
    
    private var scaleX: CGFloat
    private var scaleY: CGFloat
    private var duration: Double
    private var delay: Double
    
    public init(withScaleX scaleX: CGFloat = 1.5,
                scaleY: CGFloat = 1.5,
                duration: Double = 0.3,
                delay: Double = 0) {
        self.scaleX = scaleX
        self.scaleY = scaleY
        self.duration = duration
        self.delay = delay
    }
    
    public func prepareForAnimation(onYCTabBar tabBar: UIView, withContainers containers: [YCTabBarContainer], andInitialIndex initialIndex: Int) {
        var itemsToDismiss = containers
        itemsToDismiss.remove(at: initialIndex)
        self.zoom(toItem: containers[initialIndex], whileDismissing: itemsToDismiss)
    }
    
    public func performAnimation(fromIndex: Int,
                                 toIndex: Int,
                                 onYCTabBar tabBar: UIView,
                                 withContainers containers: [YCTabBarContainer],
                                 completion: @escaping () -> Void) {
        
        var itemsToDismiss = containers
        itemsToDismiss.remove(at: toIndex)
        
        self.zoom(toItem: containers[toIndex],
                  whileDismissing: itemsToDismiss)
        completion()
    }
    
    fileprivate func zoom(toItem enlargeItem: YCTabBarContainer,
                          whileDismissing otherItems: [YCTabBarContainer]) {
        
        enlargeItem.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        let _ = otherItems.map { item in
            item.transform = CGAffineTransform.identity
            item.setState(isSelected: true)
        }
        
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       usingSpringWithDamping: 4,
                       initialSpringVelocity: 1.0,
                       options: .allowUserInteraction,
                       animations: {
                        enlargeItem.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                        let _ = otherItems.map { item in
                            item.transform = CGAffineTransform(scaleX: 1, y: 1)
                            item.setState(isSelected: false)
                        }
        })
    }
}
