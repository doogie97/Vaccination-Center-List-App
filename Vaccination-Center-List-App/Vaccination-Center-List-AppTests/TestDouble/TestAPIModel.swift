//
//  TestAPIModel.swift
//  Vaccination-Center-List-AppTests
//
//  Created by 최최성균 on 2022/09/28.
//

import Foundation
@testable import Vaccination_Center_List_App

struct TestAPIModel: APIable {
    var bookTitle: String
    var host: String
    var path: String
    var params: [String : String]?
    var method: HTTPMethod
}
