//
//  QiitaArticlesCollectionViewCell.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/03.
//

import Model
import UIKit

public class QiitaArticlesCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView {
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var articleTitleLabel: UILabel!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var lgtmCountLabel: UILabel!

    public func setup(_ article: QiitaArticle) {
//        userImageView.image = article.userImgURL
        articleTitleLabel.text = article.title
        userNameLabel.text = "by \(article.userName)"
        lgtmCountLabel.text = "LGTM \(article.likeCount)"
    }
}
