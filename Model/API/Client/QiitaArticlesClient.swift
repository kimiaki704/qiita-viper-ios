//
//  QiitaArticlesClient.swift
//  Model
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Alamofire

public protocol QiitaArticlesClientType {
    func fetch(page: Int, pagePer: Int, limit: Int, headers: HTTPHeaders?, completion: @escaping (Result<APIResponce, Error>) -> Void)
}

public class QiitaArticlesClient: APIClient, QiitaArticlesClientType {
    public override init() { super.init() }

    public func fetch(page: Int, pagePer: Int, limit: Int, headers: HTTPHeaders?, completion: @escaping (Result<APIResponce, Error>) -> Void) {
        let params = QiitaArticlesParams.fetch(page: page, pagePer: pagePer, limit: limit)
        // swiftlint:disable:next force_cast
        request(endpoint: Endpoints.QiitaArticles.self as! Endpoint,
                parameters: params.to,
                headers: headers) { result in
            switch result {
            case .success(let res): completion(.success(res))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
