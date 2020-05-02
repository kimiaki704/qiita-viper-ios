//
//  QiitaArticlesTranslator.swift
//  Model
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

public class QiitaArticlesTranslator {
    public init() {}

    func translateToPochi(from input: Data) -> [QiitaArticle] {
        // swiftlint:disable:next force_try
        try! JSONDecoder().decode([QiitaArticle].self, from: input)
    }
}
