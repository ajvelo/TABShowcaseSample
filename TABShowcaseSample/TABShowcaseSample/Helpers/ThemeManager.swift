//
//  ThemeManager.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 07/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import UIKit

class ThemeManager {
    
    static func setup() {

        UINavigationBar.appearance().barTintColor = UIColor.darkGray
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
