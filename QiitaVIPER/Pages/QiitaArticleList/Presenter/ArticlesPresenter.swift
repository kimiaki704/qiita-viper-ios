//
//  ArticlesPresenter.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Model

class ArticlesPresenter: ArticlesPresentation {
    struct ArticlesState {
        var page = 1
        let pagePer = 20
    }

    private var state: ArticlesState = ArticlesState()
    weak var view: ArticlesView?
    var interactor: ArticlesUseCase!
    var router: ArticlesWireframe!

    var articles: [QiitaArticle] = [] {
        didSet {
            if articles.count > 0 {
                view?.showArticlesData(articles)
            } else {
                view?.showNoContentScreen()
            }
        }
    }

    func viewDidLoad() {
        interactor.fetchArticles(page: state.page, pagePer: state.pagePer)
    }

    func didSelectArticle(_ article: QiitaArticle) {
        router.presentDetailViewController(article)
    }

    func refreshCollectionView() {
        state.page = 1
        interactor.fetchArticles(page: state.page, pagePer: state.pagePer)
    }
}

extension ArticlesPresenter: ArticlesInteractorOutput {
    func articlesFetched(_ articles: [QiitaArticle]) {
        self.articles = articles
    }

    func articlesFetchFailed(_ error: Error) {
        print(error)
    }
}
