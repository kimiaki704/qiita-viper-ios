//
//  ViewControllerResolver.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Component
import UIKit

extension Resolver {
    func resolveArticlesViewController() -> ArticlesListViewController {
        ArticlesListViewController.instantiate()
    }

    func resolveDetailViewController() -> DetailViewController {
        DetailViewController.instantiate()
    }
}
