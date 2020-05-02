//
//  InstantiatableExtension.swift
//  Component
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import UIKit

extension Instantiatable {
    public static var storyboardName: String {
        String(describing: self)
    }

    public static var bundle: Bundle? {
        Bundle(for: self)
    }
}

extension Instantiatable where Self: UIViewController {
    public static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        // swiftlint:disable:next force_cast
        return storyboard.instantiateViewController(withIdentifier: storyboardName) as! Self
    }
}
