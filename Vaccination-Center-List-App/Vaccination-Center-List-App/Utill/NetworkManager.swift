//
//  NetworkManager.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

import Foundation

struct NetworkManager {
    private let session: URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.session = urlSession
    }
    
    private func makeURL(api: APIable) -> URL? {
        var component = URLComponents(string: api.host + api.path)
        
        component?.percentEncodedQueryItems = api.params?.compactMap {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        return component?.url
    }
}
