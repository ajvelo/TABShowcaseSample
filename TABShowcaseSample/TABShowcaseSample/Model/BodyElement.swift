//
//  BodyElement.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import Foundation

enum BodyElementEnum: Codable {
    case bodyElement(BodyElement)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(BodyElement.self) {
            self = .bodyElement(x)
            return
        }
        throw DecodingError.typeMismatch(BodyElementEnum.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for BodyElementEnum"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bodyElement(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - BodyElement
struct BodyElement: Codable {
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
    }
}

// MARK: BodyElement convenience initializers and mutators

extension BodyElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(BodyElement.self, from: data)
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
