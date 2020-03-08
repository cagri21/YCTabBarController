//
//  YCTabBarController.swift
//  YCTabBarController
//
//  Created by Çağrı Yörükoğlu on 8.03.2020.
//  Copyright © 2020 Çağrı Yörükoğlu. All rights reserved.
//

import UIKit
public enum AnimationStyle{
    case slide
    case underline
    case zoom
    case bounce
    case jump
    case bounceSpinRightToLeft
    case bounceSpinLeftToRight
}
open class YCTabBarController: UITabBarController {
    
    //MARK:- Properties
    
    
    public init(initialViewControllers:[YCTabbableViewController]){
        super.init(nibName: nil, bundle: nil)
        self.initialViewControllers = initialViewControllers
        configureViews()
    }
    
    
    
    public var backgroundColorsSlideAnimation:[UIColor]=[UIColor](){
        didSet{
            configureViews()
        }
    }
    
    public var initialIndex = 0{
        didSet{
            configureViews()
        }
        
    }
    
    public var bounceAnimation=AnimationStyle.bounce{
        didSet{
            configureViews()
        }
    }
    
    public var ycTabBarBackgroundColor = UIColor.black{
        didSet{
            configureViews()
        }
    }
    
    public var height = 40{
        didSet{
            configureViews()
        }
    }
    
    public var mdvTabBarControllerDelegate : YCTabBarControllerDelegate?
    
    private var ycTabBar: YCTabBar!
    
    public var initialViewControllers:[YCTabbableViewController]=[YCTabbableViewController]()
    //MARK:- Initialiser
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    //MARK:- Private Methods
    private func configureViews() {
        
        
        tabBar.isHidden = true
        viewControllers = initialViewControllers
        
        
        
        ycTabBar = YCTabBar(withInitialIndex: initialIndex,
                            backgroundColor:ycTabBarBackgroundColor )
        view.addSubview(ycTabBar)
        setupUITabBarConstraints(withHeightOf: CGFloat(height))
        ycTabBar.mdvTabBarDataSource = self
        ycTabBar.mdvTabBarDelegate = self
        
    }
    
    private func setupUITabBarConstraints(withHeightOf height: CGFloat) {
        ycTabBar.translatesAutoresizingMaskIntoConstraints = false
        ycTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        ycTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        if #available(iOS 11.0, *) {
            ycTabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            let bottomView = UIView(frame: .zero)
            bottomView.backgroundColor = ycTabBarBackgroundColor
            view.addSubview(bottomView)
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            bottomView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            ycTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
        ycTabBar.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.view.layoutIfNeeded()
    }
}

extension YCTabBarController: YCTabBarDelegate, YCTabBarDataSource {
    
    
    func didSelect(tabAtIndex index: Int) {
        self.selectedIndex = index
        
    }
    func setAnimationStyle() -> YCAnimationStyle? {
        return YCAnimationStyle.init(animationStyle: bounceAnimation)
    }
    
    
    func ycTabBarItems() -> [UITabBarItem] {
        return self.initialViewControllers.map({ $0.ycTabBarItem() })
    }
    
    func animationColors() -> [UIColor]? {
        if backgroundColorsSlideAnimation.count == 0{
            
            var colors:[UIColor]=[UIColor]()
            
            for i in 0..<self.initialViewControllers.count{
                colors.append(.blue)
            }
            
            return colors
        }else{
            return self.backgroundColorsSlideAnimation
        }
        
    }
    
}
