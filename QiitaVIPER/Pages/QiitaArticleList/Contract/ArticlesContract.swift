//
//  ArticlesContract.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Model
import UIKit

/*
 イベントごとの関数じゃなくて１つのeventHandle関数でenumによってイベント管理するのもありかも
 */

protocol ArticlesView: class {
    var presenter: ArticlesPresentation! { get set }

    func showNoContentScreen()
    func showArticlesData(_ articles: [QiitaArticle])
}

protocol ArticlesPresentation: class {
    var view: ArticlesView? { get set }
    var interactor: ArticlesUseCase! { get set }
    var router: ArticlesWireframe! { get set }

    func viewDidLoad()
    func didSelectArticle(_ article: QiitaArticle)
    func refreshCollectionView()
    func loadMoreCollectionView()
}

protocol ArticlesUseCase: class {
    var output: ArticlesInteractorOutput! { get set }
    func fetchArticles(page: Int, pagePer: Int)
    func loadMoreArticles(page: Int, pagePer: Int)
}

protocol ArticlesInteractorOutput: class {
    func articlesFetched(_ articles: [QiitaArticle])
    func loadMoreArticles(_ articles: [QiitaArticle])
    func articlesFetchFailed(_ error: Error)
}

protocol ArticlesWireframe: class {
    static var appResolver: Resolver { get }
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
    func presentDetailViewController(_ article: QiitaArticle)
}
