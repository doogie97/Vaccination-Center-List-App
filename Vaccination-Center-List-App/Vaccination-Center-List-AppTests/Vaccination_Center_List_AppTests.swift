//
//  Vaccination_Center_List_AppTests.swift
//  Vaccination-Center-List-AppTests
//
//  Created by 최최성균 on 2022/09/28.
//

import XCTest
@testable import Vaccination_Center_List_App

final class Vaccination_Center_List_AppTests: XCTestCase {
//MARK: NetworkManager 테스트
    //테스트를 위한 메서드
    func makeDummyData(data: Data?, statusCode: Int, error: Error?) -> ResponseResult {
        let response = HTTPURLResponse(url: URL(string: "test")!, statusCode: statusCode, httpVersion: "2", headerFields: nil)
        
        return ResponseResult(data: data, response: response, error: error)
    }
}
