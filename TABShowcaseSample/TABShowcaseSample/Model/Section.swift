//
//  Section.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import Foundation

// MARK: - Section
struct Section: Codable {
    let title: String?
    let bodyElements: [BodyElementEnum]?

    enum CodingKeys: String, CodingKey {
        case title
        case bodyElements = "body_elements"
    }
}

// MARK: Section convenience initializers and mutators

extension Section {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Section.self, from: data)
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
