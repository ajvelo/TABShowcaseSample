//
//  GitHubAPI.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import Foundation

enum GitHubAPI {
    case caseStudies
}

extension GitHubAPI: EndpointType {
    var baseURL: URL {
        return URL(string: "https://raw.githubusercontent.com")!
    }

    var path: String {
        switch self {
        case .caseStudies:
            return "/theappbusiness/engineering-challenge/master/endpoints/v1/caseStudies.json"
        }
    }
}
