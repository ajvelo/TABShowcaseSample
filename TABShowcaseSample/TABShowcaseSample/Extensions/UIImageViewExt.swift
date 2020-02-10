//
//  UIImageViewExt.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 10/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import UIKit

var imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImage(fromURL urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
        } else {
            let activityView = UIActivityIndicatorView(style: .medium)
            self.addSubview(activityView)
            activityView.frame = self.bounds
            activityView.translatesAutoresizingMaskIntoConstraints = false
            activityView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            activityView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            activityView.startAnimating()

            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    activityView.stopAnimating()
                    activityView.removeFromSuperview()
                }

                if let data = data {
                    let image = UIImage(data: data)
                    imageCache.setObject(image!, forKey: url.absoluteString as NSString)
                    DispatchQueue.main.async {
                        completion(image)
                    }
                }
            }.resume()
        }
    }
}
