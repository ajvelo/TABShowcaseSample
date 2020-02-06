//
//  CaseStudiesCellViewModel.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import Foundation

class CaseStudiesCellViewModel {

    private let caseStudy: CaseStudy

    init(caseStudy: CaseStudy) {
        self.caseStudy = caseStudy
    }

    var client: String? {
        return caseStudy.client
    }

    var teaser: String? {
        return caseStudy.teaser
    }

    var vertical: String? {
        return caseStudy.vertical
    }

    var title: String? {
        return caseStudy.title
    }

    var image: String? {
        return caseStudy.heroImage
    }
    
    var section: [Section]? {
        return caseStudy.sections
    }
}
