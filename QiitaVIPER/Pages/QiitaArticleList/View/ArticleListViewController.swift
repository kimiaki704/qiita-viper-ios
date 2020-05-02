//
//  ArticleListViewController.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Component
import Model
import UIKit

final class ArticleListViewController: UIViewController, Instantiatable {
    @IBOutlet weak var collectionVIew: UICollectionView!

    var presenter: ArticlesPresentation!
    var articles: [QiitaArticle] = [] {
        didSet {
            collectionVIew.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(page: 1, pagePer: 1, limit: 50)
    }
}

extension ArticleListViewController: ArticlesView {
    func showNoContentScreen() {
        print("no content")
    }

    func showArticlesData(_ articles: [QiitaArticle]) {
        self.articles = articles
    }
}
