//
//  VaccinationsResult.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

struct VaccinationsResult: Decodable {
    let data: [VaccinationInfo]?
    
    private enum CodingKeys: String, CodingKey {
        case data
    }
}

struct VaccinationInfo: Decodable {
    
}
