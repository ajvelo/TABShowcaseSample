//
//  EndpointType.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
}
