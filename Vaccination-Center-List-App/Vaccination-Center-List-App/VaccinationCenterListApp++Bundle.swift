//
//  VaccinationCenterListApp++Bundle.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/27.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let filePath = self.path(forResource: "AppPrivacyInfo", ofType: "plist") else {
            return ""
        }
        
        guard let resouce = NSDictionary(contentsOfFile: filePath) else {
            return ""
        }
        
        guard let apiKey = resouce["API_KEY"] as? String else{
            fatalError("API KEY를 확인해 주세요")
        }
        
        return apiKey
    }
}
