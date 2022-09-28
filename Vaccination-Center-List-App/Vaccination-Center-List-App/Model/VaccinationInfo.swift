//
//  VaccinationInfo.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

struct VaccinationInfo: Decodable {
    let address: String?
    let centerName: String?
    let facilityName: String?
    let lat: String?
    let lng: String?
    let phoneNumber: String?
    let updatedAt: String?
    
    private enum codingKeys: String, CodingKey {
        case address
        case centerName
        case facilityName
        case lat
        case lng
        case phoneNumber
        case updatedAt
    }
}
