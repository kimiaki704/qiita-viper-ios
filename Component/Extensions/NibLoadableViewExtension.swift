//
//  NibLoadableViewExtension.swift
//  Component
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

import UIKit

extension NibLoadableView {
    public static var nib: UINib {
        UINib(nibName: nibName, bundle: nibBundle)
    }
    public static var nibName: String {
        String(describing: self)
    }
    public static var nibBundle: Bundle? {
        Bundle(for: self)
    }
}

extension NibLoadableView where Self: UIView {
    public static func loadViewFromNib() -> Self {
        // swiftlint:disable:next force_cast
        nib.instantiate(withOwner: self, options: nil).first as! Self
    }
}
