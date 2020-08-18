//
//  CountriesViewController.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 10.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: CountriesViewPresenterProtocol?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getCountriesFromLocal()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CountryCell.self, forCellReuseIdentifier: String(describing: CountryCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = refreshControl
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRequest), for: .valueChanged)
        return refreshControl
    }()
    @objc func pullToRequest(sender: UIRefreshControl) {
        presenter?.getCountriesFromNetwork()
        sender.endRefreshing()
    }
}
