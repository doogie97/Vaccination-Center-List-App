//
//  NetworkManager.swift
//  Vaccination-Center-List-App
//
//  Created by 최최성균 on 2022/09/28.
//

import RxSwift

struct NetworkManager {
    private let session: URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.session = urlSession
    }
    
    func request(api: APIable) -> Observable<Data> {
        return Observable.create { emitter in
            guard let url = makeURL(api: api) else {
                emitter.onError(APIError.urlError)
                return Disposables.create()
            }
            
            let dataTask = session.customDataTask(request: URLRequest(url: url)) { responseResult in
                guard responseResult.error == nil else {
                    emitter.onError(APIError.transportError)
                    return
                }
                
                guard let response = responseResult.response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    emitter.onError(APIError.responseError)
                    return
                }
                
                guard let data = responseResult.data else {
                    emitter.onError(APIError.dataError)
                    return
                }
                
                emitter.onNext(data)
                emitter.onCompleted()
            }
            
            dataTask.resume()
            
            return Disposables.create() {
                dataTask.cancel()
            }
        }
    }
    
    private func makeURL(api: APIable)-> URL? {
        var component = URLComponents(string: api.host + api.path)
        
        component?.percentEncodedQueryItems = api.params?.compactMap {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        return component?.url
    }
}
