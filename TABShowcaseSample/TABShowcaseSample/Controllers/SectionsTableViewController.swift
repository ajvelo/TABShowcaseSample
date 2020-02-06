//
//  SectionsTableViewController.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import UIKit

class SectionsTableViewController: UITableViewController {
    
    var sections: [Section]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for section in sections! {
            let viewmodel = CaseStudiesSectionCellViewModel(caseStudySection: section)
            for i in viewmodel.bodyElements! {
                print(i.self)
            }
        }
    }
}
