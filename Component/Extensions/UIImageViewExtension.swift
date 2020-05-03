//
//  UIImageViewExtension.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/03.
//

import UIKit

extension UIImageView {
    public func loadImage(_ urlString: String, processors: [ImageDownloader.Processor] = []) {
        ImageDownloader.fetch(with: urlString, processors: processors) { [weak self] result in
            switch result {
            case .success(let image): self?.image = image
            case .failure(let error): print("💩 error : \(error) \n")
            }
        }
    }
}
