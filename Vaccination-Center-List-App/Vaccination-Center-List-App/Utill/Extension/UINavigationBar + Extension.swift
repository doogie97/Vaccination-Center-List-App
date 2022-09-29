//
//  UINavigationBar + Extension.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/29.
//

import UIKit

extension UINavigationBar {
    func setBackgroundColor(color: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        self.standardAppearance = appearance
        self.scrollEdgeAppearance = appearance
    }
}
