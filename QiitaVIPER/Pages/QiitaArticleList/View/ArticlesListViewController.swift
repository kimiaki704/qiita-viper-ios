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
    private let refreshControl = UIRefreshControl()
    private var dataSource: UICollectionViewDiffableDataSource<ArticlesCollectionViewSection, QiitaArticle>!
    var presenter: ArticlesPresentation!
    var articles: [QiitaArticle] = [] {
        didSet {
            performSnapshot()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
        configureDataSource()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        title = "Articles"
    }
}

extension ArticlesListViewController {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.compositionalLayout(itemWidthDimension: .fractionalWidth(1.0),
                                           itemHeightDimension: .estimated(111))
        collectionView.register(QiitaArticlesCollectionViewCell.self)
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(collectionViewRefresh), for: .valueChanged)
    }

    @objc private func collectionViewRefresh() {
        presenter.refreshCollectionView()
        refreshControl.endRefreshing()
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

extension ArticlesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        presenter.didSelectArticle(articles[indexPath.row])
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let isLastCell = (articles.count - 3 == indexPath.row)
        if isLastCell { presenter.loadMoreCollectionView() }
    }
}
