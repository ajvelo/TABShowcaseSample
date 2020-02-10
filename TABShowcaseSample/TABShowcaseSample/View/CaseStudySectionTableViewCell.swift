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
    var totalBodyText = ""
    public static let reuseIdentifier = "CaseStudySectionTableViewCell"

    public var viewModel: CaseStudiesSectionCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.title
            for bodyElement in viewModel.bodyElements! {
                switch bodyElement {
                case .string(let bodyText):
                    totalBodyText.append(bodyText)
                case .bodyElement(let image):
                    if image.imageURL != nil {
                        bodyImageView?.loadImage(fromURL: image.imageURL!)
                    }
                }
            }
            bodyTextView.text = totalBodyText
        }
    }
    
    override func prepareForReuse() {
        bodyImageView.image = nil
        titleLabel.text = nil
        bodyTextView.text = nil
    }
}
