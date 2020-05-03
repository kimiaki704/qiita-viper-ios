//
//  DetailPresenter.swift
//  QiitaVIPER
//
//  Created by 鈴木 公章 on 2020/05/03.
//

import Model

class DetailPresenter: DetailPresentation {
    var view: DetailView?

    var article: QiitaArticle!

    func viewDidLoad() {
        view?.showDetail(article)
    }
}
