//
//  ViewController.swift
//  TABShowcaseSample
//
//  Created by Andreas Velounias on 06/02/2020.
//  Copyright © 2020 Andreas Velounias. All rights reserved.
//

import UIKit

class CaseStudyTableViewController: UITableViewController {
    
    private let viewModel = CaseStudiesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.getCaseStudies { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CaseStudyTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? CaseStudyTableViewCell else {
            return UITableViewCell()
        }

        let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
        cell.viewModel = cellViewModel

        return cell
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destionationViewController = segue.destination as? UserViewController,
//            let selectionIndexPath = tableView.indexPathForSelectedRow {
//            let userLogin = viewModel.selectedUserLogin(index: selectionIndexPath.row)
//            destionationViewController.userLogin = userLogin
//        }
//    }
}

