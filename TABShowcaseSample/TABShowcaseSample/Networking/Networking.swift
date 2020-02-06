//
//  Networking.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import Foundation

struct Networking {

    func performNetworkTask(endpoint: GitHubAPI,
                            completion: ((_ success: Bool, _ response: CaseStudies?) -> Void)?) {
        guard let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding else { return }
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.caseStudiesTask(with: url) { caseStudies, response, error in
            if let json = caseStudies {
                completion?(true, json)
            }
        }
        task.resume()
    }
}
