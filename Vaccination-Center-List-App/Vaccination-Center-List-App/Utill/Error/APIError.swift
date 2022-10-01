//
//  APIError.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

enum APIError: Error {
    case urlError
    case transportError
    case responseError
    case dataError
    case decodeError
    
    var errorMessage: String {
        return "서버 통신 중 오류가 발생했습니다\n(Error code: \(self))"
    }
}
