//
//  ViewProtocols.swift
//  Component
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

protocol Instantiatable: class {
    static var storyboardName: String { get }
    static var bundle: Bundle? { get }
}

protocol NibLoadableView: class {
    static var nibName: String { get }
    static var nibBundle: Bundle? { get }
}
