//
//  UIView + Extension.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/30.
//

import UIKit

extension UIView {
    func setShadow(offset: CGSize, opacity: Float = 0.15, radius: CGFloat = 10, width: CGFloat, height: CGFloat) {
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: CGRect(x: .zero,
                                                          y: .zero,
                                                          width: width,
                                                          height: height)).cgPath
    }
}
