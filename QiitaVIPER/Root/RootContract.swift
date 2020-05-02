//
//  RootContract.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import UIKit

protocol RootWireframe: class {
    static var appResolver: Resolver { get }
    func presentArticleListViewController(in window: UIWindow)
}
