//
//  ViewController.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let networking = Networking()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        networking.performNetworkTask(endpoint: .caseStudies) { (success, caseStudies) in
            if success {
                print(caseStudies)
            }
        }
    }
}

