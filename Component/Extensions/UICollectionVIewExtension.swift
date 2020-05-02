//
//  UICollectionVIewExtension.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/03.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: NibLoadableView, T: ReusableView {
        register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else { fatalError("Cannot create new cell") }
        return cell
    }
}
