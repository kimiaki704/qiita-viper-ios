//
//  ArticleListViewController.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Component
import Model
import UIKit

final class ArticlesListViewController: UIViewController, Instantiatable {
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<ArticlesCollectionViewSection, QiitaArticle>!
    var presenter: ArticlesPresentation!
    var articles: [QiitaArticle] = [] {
        didSet {
            performSnapshot()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configureDataSource()
        presenter.viewDidLoad()
    }
}

extension ArticlesListViewController {
    private func setupCollectionView() {
        collectionView.compositionalLayout(itemWidthDimension: .fractionalWidth(1.0),
                                           itemHeightDimension: .estimated(111))
        collectionView.register(QiitaArticlesCollectionViewCell.self)
    }

    func performSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<ArticlesCollectionViewSection, QiitaArticle>()
        snapshot.appendSections([.main])
        snapshot.appendItems(articles)
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<ArticlesCollectionViewSection, QiitaArticle>(collectionView: collectionView) { collectionView, indexPath, item -> UICollectionViewCell? in
            let cell: QiitaArticlesCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(item)
            return cell
        }
    }
}

extension ArticlesListViewController: ArticlesView {
    func showNoContentScreen() {
        #warning("TODO: 記事ないときの処理")
    }

    func showArticlesData(_ articles: [QiitaArticle]) {
        self.articles = articles
    }
}
