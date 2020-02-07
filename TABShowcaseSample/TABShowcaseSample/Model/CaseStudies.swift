//
//  CaseStudies.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import Foundation

// MARK: - CaseStudies
struct CaseStudies: Codable {
    let caseStudies: [CaseStudy]?

    enum CodingKeys: String, CodingKey {
        case caseStudies = "case_studies"
    }
}

// MARK: CaseStudies convenience initializers and mutators

extension CaseStudies {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CaseStudies.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
}
