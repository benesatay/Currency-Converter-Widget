//
//  UIView + Extensions.swift
//  curcon
//
//  Created by Bahadır Enes Atay on 18.01.2021.
//

import UIKit

extension UIView {

    func setViewShadow(shadowColor: CGColor, shadowOpacity: Float, shadowRadius: CGFloat) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
    }

    
    func addBackground(color: UIColor, shadowColor: UIColor, borderColor: UIColor, shadowOpacity: Float, shadowRadius: CGFloat, cornerRadius: CGFloat, alpha: CGFloat) {
        let subView = UIView()
        subView.frame = bounds
        subView.backgroundColor = color
        subView.layer.cornerRadius = cornerRadius
        subView.alpha = alpha
        subView.layer.borderWidth = 1.0
        subView.layer.borderColor = borderColor.cgColor
        subView.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        subView.layer.shadowColor = shadowColor.cgColor
        subView.layer.shadowRadius = shadowRadius
        subView.layer.shadowOpacity = shadowOpacity
        
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        addSubview(subView)
        insertSubview(subView, at: 0)
    }
}
