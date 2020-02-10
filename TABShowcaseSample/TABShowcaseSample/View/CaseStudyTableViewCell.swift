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
            if let url = viewModel.image {
                heroImage.loadImage(fromURL: url) { [weak self] (image) in
                    self?.heroImage.image = image
                }
            }
            teaserLabel.text = viewModel.teaser
            titleLabel.text = viewModel.title
            clientLabel.text = viewModel.client
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        heroImage.image = nil
        teaserLabel.text = nil
        titleLabel.text = nil
        clientLabel.text = nil
    }
}
