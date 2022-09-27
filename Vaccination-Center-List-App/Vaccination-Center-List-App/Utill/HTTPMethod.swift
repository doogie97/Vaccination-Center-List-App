//
//  HTTPMethod.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/27.
//

enum HTTPMethod {
    case get
    
    var string: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}
