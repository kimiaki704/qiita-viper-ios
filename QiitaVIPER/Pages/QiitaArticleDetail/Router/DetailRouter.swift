//
//  DetailRouter.swift
//  QiitaVIPER
//
//  Created by 鈴木 公章 on 2020/05/03.
//

import Model
import UIKit

class DetailRouter: DetailWireframe {
    static var appResolver: Resolver { Resolver.shared }
    weak var viewController: UIViewController?

    static func assembleModule(_ article: QiitaArticle) -> UIViewController {
        let view = appResolver.resolveDetailViewController()
        let presenter = DetailPresenter()
        let router = DetailRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.article = article

        router.viewController = view

        return view
    }
}
