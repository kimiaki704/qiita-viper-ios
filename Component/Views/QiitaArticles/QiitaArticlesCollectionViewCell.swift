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
        contentView.isUserInteractionEnabled = false
        userImageView.loadImage(article.userImgURL, processors: [.circle])
        articleTitleLabel.text = article.title
        lgtmCountLabel.text = "LGTM \(article.likeCount)"
        userNameLabel.text = "by \(article.userName)"
        if article.userName == "" { userNameLabel.isHidden = true }
    }
}
