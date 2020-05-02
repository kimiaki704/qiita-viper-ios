//
//  ObjectContainer.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import Foundation

class ObjectContainer {
    private var container: [String: Any]
    private let queue = DispatchQueue(label: "neighba.container.lockQueue")

    init() { container = [:] }

    func singleton<T>(key: String? = nil, _ selector: () -> T) -> T {
        queue.sync {
            let key = key ?? String(describing: T.self)
            if let instance = container[key] as? T {
                debugPrint("Reuse singletion instance. KEY => \(key)")
                return instance
            }
            let newInstance = selector()
            debugPrint("Create new singleton instance. KEY => \(key)")
            container[key] = newInstance as Any
            return newInstance
        }
    }
}
