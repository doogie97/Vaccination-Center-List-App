//
//  APIModel.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/27.
//

protocol APIable {
    var host: String { get }
    var path: String { get }
    var params: [String: String]? { get }
    var method: HTTPMethod { get }
}
