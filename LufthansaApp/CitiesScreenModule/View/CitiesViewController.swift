//
//  CitiesViewController.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: CitiesViewPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CityCell.self, forCellReuseIdentifier: String(describing: CityCell.self))
        tableView.dataSource = self
        tableView.delegate = self
    }
}
