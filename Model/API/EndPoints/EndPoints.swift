//
//  EndPoints.swift
//  Model
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Alamofire

struct API {
    static let qiitaURL = "https://qiita.com/api/v2"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
    var method: HTTPMethod { get }
}

enum Endpoints {
    case qiitaArticlesFetch

    var path: String {
        switch self {
        case .qiitaArticlesFetch: return "/items"
        }
    }

    var url: String {
        switch self {
        case .qiitaArticlesFetch: return API.qiitaURL + path
        }
    }

    var method: HTTPMethod {
        switch self {
        case .qiitaArticlesFetch:
            return .get
        }
    }
}
