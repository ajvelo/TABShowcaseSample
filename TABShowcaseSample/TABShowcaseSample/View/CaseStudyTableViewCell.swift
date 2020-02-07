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
                do {
                    let data = try Data(contentsOf: URL(string: url)!)
                    let image = UIImage(data: data)
                    DispatchQueue.main.async { [weak self] in
                        self?.heroImage.image = image
                    }
                } catch _ { }
            }
            teaserLabel.text = viewModel.teaser
            titleLabel.text = viewModel.title
            clientLabel.text = viewModel.client
        }
    }
    
    func getImage(str: String) -> UIImage? {
        let url = URL(string: str)
        if let data = try? Data(contentsOf: url!) {
            return UIImage(data: data)!
        } else {
            return nil
        }
    }
}
