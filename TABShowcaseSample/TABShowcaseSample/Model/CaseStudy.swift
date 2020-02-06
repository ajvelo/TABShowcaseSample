//
//  CaseStudy.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import Foundation

// MARK: - CaseStudy
struct CaseStudy: Codable {
    let id: Int?
    let client: String?
    let teaser, vertical: String?
    let isEnterprise: Bool?
    let title: String?
    let heroImage: String?
    let sections: [Section]?
    let appStoreURL: String?

    enum CodingKeys: String, CodingKey {
        case id, client, teaser, vertical
        case isEnterprise = "is_enterprise"
        case title
        case heroImage = "hero_image"
        case sections
        case appStoreURL = "app_store_url"
    }
}

// MARK: CaseStudy convenience initializers and mutators

extension CaseStudy {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CaseStudy.self, from: data)
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

    func with(
        id: Int?? = nil,
        client: String?? = nil,
        teaser: String?? = nil,
        vertical: String?? = nil,
        isEnterprise: Bool?? = nil,
        title: String?? = nil,
        heroImage: String?? = nil,
        sections: [Section]?? = nil,
        appStoreURL: String?? = nil
    ) -> CaseStudy {
        return CaseStudy(
            id: id ?? self.id,
            client: client ?? self.client,
            teaser: teaser ?? self.teaser,
            vertical: vertical ?? self.vertical,
            isEnterprise: isEnterprise ?? self.isEnterprise,
            title: title ?? self.title,
            heroImage: heroImage ?? self.heroImage,
            sections: sections ?? self.sections,
            appStoreURL: appStoreURL ?? self.appStoreURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

