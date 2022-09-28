//
//  StubURLDataTask.swift
//  Vaccination-Center-List-AppTests
//
//  Created by 최최성균 on 2022/09/28.
//

import Foundation
@testable import Vaccination_Center_List_App

final class StubURLSessionDataTask: URLSessionDataTask {
    var fakeResume: () -> Void = {}
    
    override func resume() {
        fakeResume()
    }
}
