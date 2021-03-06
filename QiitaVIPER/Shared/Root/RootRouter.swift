//
//  RootRouter.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import UIKit

class RootRouter: RootWireframe {
    func presentArticleListViewController(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = ArticlesRouter.assembleModule()
    }
}
