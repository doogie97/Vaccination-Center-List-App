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
    
    func test_request호출시_url이잘못되었을경우_urlError를_잘던지는지() {
        //given
        let promise = expectation(description: "urlError를 잘 던지는지")
        let dummyData = makeDummyData(data: Data(), statusCode: 200, error: nil)
        let networkManager = NetworkManager(urlSession: StubURLSession(dummyData: dummyData))
        let wrongString = "      "
        let testAPIModel = TestAPIModel(bookTitle: "", host: wrongString, path: "", method: .get)
        
        //when
        networkManager.request(api: testAPIModel) { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                //then
                XCTAssertEqual(error, .urlError)
                promise.fulfill()
            }
        }
        
        wait(for: [promise], timeout: 5)
    }
    
    func test_request호출시_error가있을경우_transportError를_잘던지는지() {
        //given
        let promise = expectation(description: "transportError를 잘 던지는지")
        let dummyData = makeDummyData(data: Data(), statusCode: 200, error: APIError.urlError)
        let networkManager = NetworkManager(urlSession: StubURLSession(dummyData: dummyData))
        let testAPIModel = TestAPIModel(bookTitle: "", host: "", path: "", method: .get)
        
        //when
        networkManager.request(api: testAPIModel) { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                //then
                XCTAssertEqual(error, .transportError)
                promise.fulfill()
            }
        }
        
        wait(for: [promise], timeout: 5)
    }
    
    
    func test_request호출시_statusCode가_불안정할경우_responseError를_잘던지는지() {
        //given
        let promise = expectation(description: "responseError를 잘 던지는지")
        let dummyData = makeDummyData(data: Data(), statusCode: 404, error: nil)
        let networkManager = NetworkManager(urlSession: StubURLSession(dummyData: dummyData))
        let testAPIModel = TestAPIModel(bookTitle: "", host: "", path: "", method: .get)
        
        //when
        networkManager.request(api: testAPIModel) { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                //then
                XCTAssertEqual(error, .responseError)
                promise.fulfill()
            }
        }
        
        wait(for: [promise], timeout: 5)
    }
    
    func test_request호출시_data가_없을경우_dataError를_잘던지는지() {
        //given
        let promise = expectation(description: "dataError를 잘 던지는지")
        let dummyData = makeDummyData(data: nil, statusCode: 200, error: nil)
        let networkManager = NetworkManager(urlSession: StubURLSession(dummyData: dummyData))
        let testAPIModel = TestAPIModel(bookTitle: "", host: "", path: "", method: .get)
        
        //when
        networkManager.request(api: testAPIModel) { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                //then
                XCTAssertEqual(error, .dataError)
                promise.fulfill()
            }
        }
        
        wait(for: [promise], timeout: 5)
    }
}
