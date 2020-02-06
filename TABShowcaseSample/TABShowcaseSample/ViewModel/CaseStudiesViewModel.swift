//
//  CaseStudiesViewModel.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import Foundation

class CaseStudiesViewModel {

    private let networking = Networking()

    private var caseStudies: [CaseStudy]?

    public func getCaseStudies(completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: .caseStudies) { [weak self] (success, response) in
            if success {
                self?.caseStudies = response?.caseStudies
                completion?()
            }
        }
    }

    public func cellViewModel(index: Int) -> CaseStudiesCellViewModel? {
        guard let caseStudies = caseStudies else { return nil }
        let caseStudiesCellViewModel = CaseStudiesCellViewModel(caseStudy: caseStudies[index])
        return caseStudiesCellViewModel
    }
    
    public var count: Int {
        return caseStudies?.count ?? 0
    }
    
    public func selectedCaseStudy(index: Int) -> CaseStudy? {
        return caseStudies?[index] ?? nil
    }
}
