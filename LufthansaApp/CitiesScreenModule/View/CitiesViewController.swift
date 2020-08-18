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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getCitiesFromLocal()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CityCell.self, forCellReuseIdentifier: String(describing: CityCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = refreshControl
    }
    let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRequest), for: .valueChanged)
        return refreshControl
    }()
    @objc func pullToRequest(sender: UIRefreshControl) {
        presenter?.getCitiesFromNetwork()
        sender.endRefreshing()
    }
}
