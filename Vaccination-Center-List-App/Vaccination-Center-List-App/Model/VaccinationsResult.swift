//
//  VaccinationsResult.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

struct VaccinationsResult: Decodable {
    let vaccinations: [VaccinationInfo]?
    
    private enum CodingKeys: String, CodingKey {
        case vaccinations = "data"
    }
}
