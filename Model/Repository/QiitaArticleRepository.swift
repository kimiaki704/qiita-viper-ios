//
//  QiitaArticleRepository.swift
//  Model
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

public protocol QiitaArticleRepositoryType {
    func fetch(page: Int, pagePer: Int, limit: Int, completion: @escaping (Result<[QiitaArticle], Error>) -> Void)
}

public class QiitaArticleRepository: QiitaArticleRepositoryType {
    public init() {}

    public func fetch(page: Int, pagePer: Int, limit: Int, completion: @escaping (Result<[QiitaArticle], Error>) -> Void) {
        let client = QiitaArticlesClient()
        client.fetch(page: page,
                     pagePer: pagePer,
                     limit: limit,
                     headers: []) { result in
            switch result {
            case .success(let res):
                #warning("TODO: data無しの処理")
                guard let data = res.data else { fatalError() }
                let translator = QiitaArticlesTranslator()
                completion(.success(translator.translateToPochi(from: data)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
