//
//  DetailViewController.swift
//  QiitaVIPER
//
//  Created by 鈴木 公章 on 2020/05/03.
//

import Component
import Model
import UIKit
import WebKit

final class DetailViewController: UIViewController, Instantiatable {
    @IBOutlet private weak var webView: WKWebView!
    var presenter: DetailPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        title = "Detail"
    }
}

extension DetailViewController: DetailView {
    func showDetailData(_ article: QiitaArticle) {
        let url = URL(string: article.url)!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
