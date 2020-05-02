//
//  QiitaArticlesParams.swift
//  Model
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

public enum QiitaArticlesParams {
    case fetch(page: Int, pagePer: Int)

    var to: [String: Any] {
        switch self {
        case .fetch(let page, let pagePer):
            var params: [String: Any] = [:]
            params["page"] = page
            params["page_per"] = pagePer
            return params
        }
    }
}
