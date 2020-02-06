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
                                        completion: @escaping ((_ response: CaseStudy) -> Void)) {
        let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
        guard let urlRequest = URL(string: urlString ?? "") else { return }

        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let _ = error {
                return
            }
            guard let data = data else {
                return
            }
            
            do {
                let caseStudy = try CaseStudy(data: data)
                completion(caseStudy)
            } catch {
                print("Error")
            }
        }
        urlSession.resume()
    }
}
