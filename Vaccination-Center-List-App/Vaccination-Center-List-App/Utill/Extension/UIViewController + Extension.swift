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
    
    func goSettingAlert(title: String, messege: String) {
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        let settingAction = UIAlertAction(title: "설정", style: .default) { _ in
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(settingAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}
