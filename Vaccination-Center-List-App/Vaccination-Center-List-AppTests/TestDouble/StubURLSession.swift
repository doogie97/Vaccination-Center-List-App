//
//  StubURLSession.swift
//  Vaccination-Center-List-AppTests
//
//  Created by 최최성균 on 2022/09/28.
//

import Foundation
@testable import Vaccination_Center_List_App

struct StubURLSession: URLSessionProtocol {
    private let dummyData: ResponseResult
    
    init(dummyData: ResponseResult) {
        self.dummyData = dummyData
    }

    private func stubDataTask(requset: URLRequest, completion: @escaping (ResponseResult) -> Void) -> URLSessionDataTask {
        let stubDataTask = StubURLSessionDataTask()
        
        stubDataTask.fakeResume = {
            completion(dummyData)
        }
        
        return stubDataTask
    }

    func customDataTask(request: URLRequest, completion: @escaping (ResponseResult) -> Void) -> URLSessionDataTask {
        
        let dataTask = stubDataTask(requset: request) { result in
            completion(result)
        }
        
        return dataTask
    }
}
