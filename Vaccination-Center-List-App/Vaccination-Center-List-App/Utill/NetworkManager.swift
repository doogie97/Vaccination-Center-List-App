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
    
    func request(api: APIable, completion: @escaping (Result<Data, APIError>) -> Void) {
        guard let url = makeURL(api: api) else {
            completion(.failure(APIError.urlError))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = api.method.string
        
        let dataTask = session.customDataTask(request: request) { responseResult in
            guard responseResult.error == nil else {
                completion(.failure(.transportError))
                return
            }
            
            guard let response = responseResult.response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(.failure(.responseError))
                return
            }
            
            guard let data = responseResult.data else {
                completion(.failure(.dataError))
                return
            }
            
            completion(.success(data))
        }
        
        dataTask.resume()
    }
    
    private func makeURL(api: APIable) -> URL? {
        var component = URLComponents(string: api.host + api.path)
        
        component?.percentEncodedQueryItems = api.params?.compactMap {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        return component?.url
    }
}
