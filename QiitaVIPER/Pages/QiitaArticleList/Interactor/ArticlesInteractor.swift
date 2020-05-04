//
//  ArticlesInteractor.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Model

class ArticlesInteractor: ArticlesUseCase {
    private let repository = QiitaArticleRepository()
    weak var output: ArticlesInteractorOutput!

    func fetchArticles(page: Int, pagePer: Int) {
        repository.fetch(page: page,
                         pagePer: pagePer) { result in
            switch result {
            case .success(let articles):
                self.output.articlesFetched(articles)

            case .failure(let error):
                self.output.articlesFetchFailed(error)
            }
        }
    }

    func loadMoreArticles(page: Int, pagePer: Int) {
        repository.fetch(page: page,
                         pagePer: pagePer) { result in
            switch result {
            case .success(let articles):
                self.output.loadMoreArticles(articles)

            case .failure(let error):
                self.output.articlesFetchFailed(error)
            }
        }
    }
}
