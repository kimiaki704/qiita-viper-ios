//
//  ArticlesContract.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Model
import UIKit

protocol ArticlesView {
    var presenter: ArticlesPresentation! { get set }

    func showNoContentScreen()
    func showArticlesData(_ articles: [QiitaArticle])
}

protocol ArticlesPresentation: class {
    weak var view: ArticlesView? { get set }
    var interactor: ArticlesUseCase! { get set }
    var router: ArticlesWireframe! { get set }

    func viewDidLoad()
    func didClickSortButton()
    func didSelectArticle(_ article: QiitaArticle)
}

protocol ArticlesUseCase: class {
    var output: ArticlesInteractorOutput! { get set }
    func fetchArticles(page: Int, pagePer: Int, limit: Int)
}

protocol ArticlesInteractorOutput: class {
    func articlesFetched(_ articles: [QiitaArticle])
    func articlesFetchFailed(_ error: Error)
}

protocol ArticlesWireframe: class {
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}
