//
//  UIViewController + Extension.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/10/01.
//

import UIKit

extension UIViewController {
    func showAlert(messege: String) {
        let alert = UIAlertController(title: "", message: messege, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        
        self.present(alert, animated: true)
    }
    
}
