//
//  CaseStudySectionTableViewCell.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import UIKit

class CaseStudySectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var bodyImageView: UIImageView!
    
    public static let reuseIdentifier = "CaseStudySectionTableViewCell"

    public var viewModel: CaseStudiesSectionCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
//            if viewModel.image != nil {
//                let url = URL(string: viewModel.image!)
//                if let data = try? Data(contentsOf: url!) {
//                  heroImage.image = UIImage(data: data)
//                }
//            }
            titleLabel.text = viewModel.title
            bodyTextView.text = viewModel.bodyElements?.first as? String
        }
    }
}
