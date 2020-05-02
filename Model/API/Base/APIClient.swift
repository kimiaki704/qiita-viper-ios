//
//  APIClient.swift
//  Model
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Alamofire

public class APIClient {
    func request(endpoint: Endpoints,
                 parameters: [String: Any]?,
                 headers: HTTPHeaders?,
                 completion: @escaping (Result<APIResponce, Error>) -> Void) {
        AF.request(endpoint.url,
                   method: endpoint.method,
                   parameters: parameters,
                   headers: headers)
            .validate(statusCode: 200 ..< 400)
            .validate(contentType: ["application/json"])
            .response { response in
                switch response.result {
                case .success:
                    let res = APIResponce(urlReqest: response.request,
                                          headers: response.response,
                                          data: response.data)
                    print(res)
                    completion(.success(res))
                case .failure(let error):
                    print(error)
                    #warning("TODO: Error処理")
                }
            }
    }
}
