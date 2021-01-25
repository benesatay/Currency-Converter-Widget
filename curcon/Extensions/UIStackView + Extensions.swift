//
//  UIStackView + Extensions.swift
//  curcon
//
//  Created by Bahadır Enes Atay on 18.01.2021.
//

import UIKit

extension UIStackView {
    func setupCustomStackView(arrangedSubviewArray: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, topSpace: CGFloat, leftSpace: CGFloat, bottomSpace: CGFloat, rightSpace: CGFloat) {
        for arrangedSubview in arrangedSubviewArray {
            self.addArrangedSubview(arrangedSubview)
        }
        self.spacing = spacing
        self.axis = axis
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layoutMargins = UIEdgeInsets(top: topSpace, left: leftSpace, bottom: bottomSpace, right: rightSpace)
        self.isLayoutMarginsRelativeArrangement = true
    }
}
