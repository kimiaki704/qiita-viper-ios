//
//  Resolver.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

class Resolver {
    static let shared: Resolver = Resolver()
    let container: ObjectContainer

    init() { container = ObjectContainer() }
}
