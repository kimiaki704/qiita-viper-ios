//
//  DetailContract.swift
//  QiitaVIPER
//
//  Created by 鈴木 公章 on 2020/05/03.
//

import Model
import UIKit

protocol DetailView: class {
    var presenter: DetailPresentation! { get set }

    func showDetail(_ article: QiitaArticle)
}

protocol DetailPresentation: class {
    var view: DetailView? { get set }

    func viewDidLoad()
}

protocol DetailWireframe: class {
    static var appResolver: Resolver { get }
    static func assembleModule(_ article: QiitaArticle) -> UIViewController
}
