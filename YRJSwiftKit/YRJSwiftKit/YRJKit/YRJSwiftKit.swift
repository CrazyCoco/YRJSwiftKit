//
//  YRJSwiftKit.swift
//  YRJSwiftKit
//
//  Created by YURENJIE on 2018/2/28.
//Copyright © 2018年 yurenjie. All rights reserved.
//

import UIKit


// MARK: - 视图类

extension UIView {
    
    /// 快捷方式 frame.origin.x
    public var left : CGFloat {
        get{
            return self.frame.origin.x
        }
        set(newLeft){
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
    ///快捷方式 frame.origin.y
    public var top : CGFloat {
        get{
            return self.frame.origin.y
        }
        set(newTop){
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
    ///快捷方式 frame.size.width
    public var with : CGFloat {
        get{
            return self.frame.width
        }
        set(newWith){
            var frame = self.frame
            frame.size.width = newWith
            self.frame = frame
        }
    }
    
    
    ///快捷方式 frame.size.height
    public var height : CGFloat {
        get{
            return self.frame.height
        }
        set(newHeight){
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
    ///快捷方式 frame.origin.x + frame.size.width
    public var right : CGFloat {
        get{
            return self.frame.origin.x + self.frame.width
        }
        set(newRight){
            var frame = self.frame
            frame.origin.x = newRight - self.frame.width
            self.frame = frame
        }
    }
    
    /// 快捷方式 frame.origin.y + frame.size.height
    public var bottom : CGFloat {
        get{
            return self.self.frame.origin.y + self.frame.size.height
        }
        set(newBottom){
            var frame = self.frame
            frame.origin.y = newBottom - self.frame.size.height
            self.frame = frame
        }
    }
    
    /// 快捷方式 center.x
    public var centerX : CGFloat {
        get{
            return self.center.x
        }
        set(newCenterX){
            self.center = CGPoint.init(x: newCenterX, y: self.center.y)
        }
    }
    
    /// 快捷方式 center.y
    public var centerY : CGFloat {
        get{
            return self.center.y
        }
        set(newCenterY){
            self.center = CGPoint.init(x: self.center.x, y: newCenterY)
        }
    }
    
    ///快捷方式 frame.origin
    public var origin : CGPoint {
        get{
            return self.frame.origin
        }
        set(newOrigin){
            var frame = self.frame
            frame.origin = newOrigin
            self.frame = frame
        }
    }
    
    ///快捷方式 frame.size
    public var size : CGSize {
        get{
            return self.frame.size
        }
        set(newSize){
            var frame = self.frame
            frame.size = newSize
            self.frame = frame
        }
    }
    
    ///圆角
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    ///边框宽度
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue > 0 ? newValue : 0
        }
    }
    
    /// 边框颜色
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    ///在屏幕上返回可见的alpha，考虑到超视图和窗口。
    public var visibleAlpha : CGFloat{
        get{
            
            if self.isKind(of: UIWindow.self) {
                
                if self.isHidden {
                    return 0;
                }
                return self.alpha
            }
            
            
            if self.window == nil {
                return 0;
            }
            
            var alpha : CGFloat = 1
            var view : UIView = self
            if view.isHidden {
                return 0
            }
            alpha *= view.alpha
            view = view.superview!
            
            return alpha;
        }
    }
    
    
    ///删除所有子视图。
    ///warning 不要在视图的drawRect:方法中调用此方法。
    func removeAllSubViews(){
        
        while self.subviews.count > 0 {
            self.subviews.last?.removeFromSuperview()
        }
        
    }
    
    
    /// 设置视图的快捷方式。层的影子
    ///
    /// - Parameters:
    ///   - color: 阴影颜色
    ///   - offset: 影子抵消
    ///   - radius: 阴影半径
    func setLayerShadow(color : UIColor, offset : CGSize, radius : CGFloat){
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = 1
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
}



// MARK: - 数据类





