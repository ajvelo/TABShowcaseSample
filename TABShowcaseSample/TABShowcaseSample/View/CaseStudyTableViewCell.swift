//
//  CaseStudyTableView.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import UIKit

class CaseStudyTableViewCell: UITableViewCell {

    @IBOutlet weak var clientLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var teaserLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    
    public static let reuseIdentifier = "CaseStudyTableViewCell"

    public var viewModel: CaseStudiesCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            if viewModel.image != nil {
                let url = URL(string: viewModel.image!)
                if let data = try? Data(contentsOf: url!) {
                  heroImage.image = UIImage(data: data)
                }
            }
            teaserLabel.text = viewModel.teaser
            titleLabel.text = viewModel.title
            clientLabel.text = viewModel.client
        }
    }

}
