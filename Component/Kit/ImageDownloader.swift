//
//  ImageDownloader.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/03.
//

import Nuke
import UIKit

public typealias ImageDownloadResult = Result<UIImage, Swift.Error>

public struct ImageDownloader {
    public enum Processor {
        case rounded(radius: CGFloat)
        case circle
        case blur(radius: Int)
        case monochrome

        func toNuke() -> ImageProcessing {
            switch self {
            case .rounded(let radius): return ImageProcessor.RoundedCorners(radius: radius)
            case .circle:
                return ImageProcessor.Circle()
            case .blur(let radius):
                return ImageProcessor.GaussianBlur(radius: radius)
            case .monochrome:
                return ImageProcessor.CoreImageFilter(name: "CISepiaTone")
            }
        }
    }

    public enum Error: Swift.Error, CustomDebugStringConvertible {
        case convertURLFailed
        case unexpected

        public var debugDescription: String {
            switch self {
            case .unexpected: return "[ImageDownloader] failed to load image because unexpected error."
            case .convertURLFailed: return "[ImageDownloader] failed to load image because convertURL."
            }
        }
    }

    public static func fetch(with url: URL, queue: DispatchQueue? = nil, processors: [Processor] = [], completion: @escaping (ImageDownloadResult) -> Void) {
        let request = ImageRequest(url: url, processors: processors.map { $0.toNuke() })
        ImagePipeline.shared.loadImage(with: request, queue: queue) { result in
            switch result {
            case .success(let response): completion(.success(response.image))
            case .failure(let error): completion(.failure(error))
            }
        }
    }

    public static func fetch(with urlString: String, queue: DispatchQueue? = nil, processors: [Processor] = [], completion: @escaping (ImageDownloadResult) -> Void) {
        guard let url = URL(string: urlString) else { return completion(.failure(Error.convertURLFailed)) }
        fetch(with: url, queue: queue, processors: processors, completion: completion)
    }
}
