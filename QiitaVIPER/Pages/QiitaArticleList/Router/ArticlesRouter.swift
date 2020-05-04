//
//  ArticlesRouter.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Model
import UIKit

class ArticlesRouter: ArticlesWireframe {
    static var appResolver: Resolver { Resolver.shared }
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let view = appResolver.resolveArticlesViewController()
        let presenter = appResolver.resolveArticlesPresenter()
        let interactor = appResolver.resolveArticlesInteractor()
        let router = appResolver.resolveArticlesRouter()
        let navigation = UINavigationController(rootViewController: view)

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view

        return navigation
    }

    func presentDetailViewController(_ article: QiitaArticle) {
        let vc = DetailRouter.assembleModule(article)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
