//
//  YCAnimationStyle.swift
//  YCTabBarController
//
//  Created by Çağrı Yörükoğlu on 8.03.2020.
//  Copyright © 2020 Çağrı Yörükoğlu. All rights reserved.
//

import Foundation
import UIKit
public class YCAnimationStyle {
    
    public var backgroundColor:[UIColor]?
    
    public var animationStyle: AnimationStyle?
    
    public init(animationStyle:AnimationStyle){
        self.animationStyle = animationStyle
    }
    
    public func setAnimation()->YCTabBarAnimatable{
        if(animationStyle == AnimationStyle.bounce){
            return configureViewBounce()
        }else if(animationStyle == AnimationStyle.jump){
            return configureViewJump()
        }else if(animationStyle == AnimationStyle.zoom){
            return configureViewZoom()
        }else if(animationStyle == AnimationStyle.underline){
            return configureViewUnderline()
        }else if(animationStyle == AnimationStyle.slide){
            return configureViewSlide()
        }else if(animationStyle == AnimationStyle.bounceSpinRightToLeft){
            return configureViewBounceSpinRightAnimator()
        }else if(animationStyle == AnimationStyle.bounceSpinLeftToRight){
            return configureViewBounceSpinLeftAnimator()
        }else{
            return configureViewJump()
        }
    }
    
    public func configureViewBounce()->YCTabBarAnimatable{
        return YCBounceAnimator(initIndex: 0)
    }
    
    public func configureViewJump()->YCTabBarAnimatable{
        return YCJumpAnimator(initIndex: 0)
    }
    public func configureViewZoom()->YCTabBarAnimatable{
        return YCZoomAnimator()
    }
    public func configureViewUnderline()->YCTabBarAnimatable{
        return YCUnderlineAnimator(withUnderlineColor: .blue, underlineHeight:  CGFloat(integerLiteral: 2), underlineWidth:  CGFloat(integerLiteral: 2), underlineOffsetY:  CGFloat(integerLiteral: 2), duration: 2.0, delay: 0.3, damping: CGFloat(integerLiteral: 2), velocity:  CGFloat(integerLiteral: 2))
    }
    public func configureViewSlide()->YCTabBarAnimatable{
        return YCSlidingOverlayAnimator(withTabBarColors: backgroundColor!)
    }
    
    public func configureViewBounceSpinRightAnimator()->YCTabBarAnimatable{
        return YCBounceSpinRightAnimator(initIndex: 0)
    }
    public func configureViewBounceSpinLeftAnimator()->YCTabBarAnimatable{
        return YCBounceSpinLeftAnimator(initIndex: 0)
    }
}
