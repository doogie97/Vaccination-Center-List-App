//
//  APIModel.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/27.
//

import Foundation

protocol APIable {
    var host: String { get }
    var path: String { get }
    var params: [String: String]? { get }
    var method: HTTPMethod { get }
}

struct VaccinationAPIModel: APIable {
    let host = "https://api.odcloud.kr/api"
    let path = "/15077586/v1/centers"
    let page: Int
    let perPage: Int
    let apiKey = Bundle.main.apiKey
    var params: [String : String]? {
        return ["page" : String(page),
                "perPage" : String(perPage),
                "serviceKey" : apiKey]
    }
    let method: HTTPMethod
}
