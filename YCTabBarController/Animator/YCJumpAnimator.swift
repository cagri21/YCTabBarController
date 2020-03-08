//
//  YCJumpAnimator.swift
//  YCTabBarController
//
//  Created by Çağrı Yörükoğlu on 8.03.2020.
//  Copyright © 2020 Çağrı Yörükoğlu. All rights reserved.
//

import Foundation
public class YCJumpAnimator: YCTabBarAnimatable {
    
    private(set) var initialIndex: Int
    
    public init(initIndex:Int){
        self.initialIndex = initIndex
    }
    public func prepareForAnimation(onMDVTabBar tabBar: UIView,
                                    withContainers containers: [YCTabBarContainer],
                                    andInitialIndex initialIndex: Int) {
        
        var itemsToDismiss = containers
        itemsToDismiss.remove(at: initialIndex)
        
        self.zoom(toItem: containers[initialIndex],
                  whileDismissing: itemsToDismiss)
        
    }
    
    public func performAnimation(fromIndex: Int,
                                 toIndex: Int,
                                 onMDVTabBar tabBar: UIView,
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
        
        enlargeItem.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        
        let _ = otherItems.map { item in
            item.transform = CGAffineTransform.identity
            item.setState(isSelected: true)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            
            enlargeItem.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                
                enlargeItem.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
                
                let _ = otherItems.map { item in
                    item.transform = CGAffineTransform(scaleX: 1, y: 1)
                    item.setState(isSelected: false)
                }
                
            }, completion: nil)
            
        }, completion: nil)
        
    }
}

