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
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(QiitaArticlesCollectionViewCell.self)
    }

    #warning("TODO: こいつ分離できそう")
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(111))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(111))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
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
