//
//  ArticlesContract.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Model

protocol ArticlesUseCase: class {
    weak var output: ArticlesInteractorOutput! { get set }
    func fetchArticles(page: Int, pagePer: Int, limit: Int)
}

protocol ArticlesInteractorOutput: class {
    func articlesFetched(_ articles: [QiitaArticle])
    func articlesFetchFailed(_ error: Error)
}
