//
//  CaseStudiesSectionCellViewModel.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import Foundation

class CaseStudiesSectionCellViewModel {

    private let caseStudySection: Section

    init(caseStudySection: Section) {
        self.caseStudySection = caseStudySection
    }

    var bodyElements: [BodyElementEnum]? {
        return caseStudySection.bodyElements
    }
    
    var title: String? {
        return caseStudySection.title
    }
}
