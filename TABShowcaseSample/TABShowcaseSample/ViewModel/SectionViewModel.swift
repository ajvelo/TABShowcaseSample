//
//  SectionViewModel.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import Foundation

class SectionViewModel {

    var sections: [Section]?

    public func cellViewModel(index: Int) -> CaseStudiesSectionCellViewModel? {
        guard let sections = sections else { return nil }
        let caseSectionStudiesCellViewModel = CaseStudiesSectionCellViewModel(caseStudySection: sections[index])
        return caseSectionStudiesCellViewModel
    }
    
    public var count: Int {
        return sections?.count ?? 0
    }
}
